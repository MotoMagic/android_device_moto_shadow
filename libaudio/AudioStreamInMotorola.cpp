/*
** Copyright 2008, The Android Open-Source Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

//#define LOG_NDEBUG
#define LOG_TAG "AudioStreamInMotorola"
#include <utils/Log.h>

#include <fcntl.h>
#include <stdint.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <linux/soundcard.h>

#include <hardware_legacy/AudioHardwareInterface.h>
#include <hardware_legacy/power.h>

#include "AudioHardwareMotorola.h"

namespace android {
// ----------------------------------------------------------------------------

// ID string for audio wakelock
static const char kInputWakelockStr[] = "AudioHardwareMotorolaIn";

static int errCount = 0;

AudioStreamInMotorola::AudioStreamInMotorola() :
        mHardware(0), mFd(-1), mStandby(true), mRetryCount(0),
        mFormat(AUDIO_HW_IN_FORMAT), mChannels(AUDIO_HW_IN_CHANNELS),
        mSampleRate(AUDIO_HW_IN_SAMPLERATE), mBufferSize(AUDIO_HW_IN_BUFSZ),
        mDevices(0), mAcoustics((AudioSystem::audio_in_acoustics)0)
{
    LOGD("AudioStreamInMotorola() called\n");
}

AudioStreamInMotorola::~AudioStreamInMotorola()
{
    LOGD("~AudioStreamInMotorola() called\n");
    standby();
}

status_t AudioStreamInMotorola::set(
        AudioHardwareMotorola* hw, uint32_t devices, int *pFormat, uint32_t *pChannels,
        uint32_t *pRate, AudioSystem::audio_in_acoustics acoustic_flags)
{
    LOGD("set(%p, %x, %d, %x, %d, %p) called\n",
            hw,
            devices,
            (pFormat == NULL ? -1 : *pFormat),
            (pChannels == NULL ? -1 : *pChannels),
            (pRate == NULL ? -1 : *pRate),
            &acoustic_flags);

    if (pFormat == 0 || *pFormat != AUDIO_HW_IN_FORMAT) {
        *pFormat = AUDIO_HW_IN_FORMAT;
        LOGE("set(): bad format value\n");
        return BAD_VALUE;
    }

    if (pRate == 0 || *pRate != AUDIO_HW_IN_SAMPLERATE) {
        *pRate = AUDIO_HW_IN_SAMPLERATE;
        LOGE("set(): bad sample rate value\n");
        return BAD_VALUE;
    }

    if (pChannels == 0 || (*pChannels != AudioSystem::CHANNEL_IN_MONO &&
            *pChannels != AudioSystem::CHANNEL_IN_STEREO)) {
        *pChannels = AUDIO_HW_IN_CHANNELS;
        LOGE("set(): bad channel value\n");
        return BAD_VALUE;
    }

    mHardware = hw;

    if (mFd >= 0) {
        LOGE("set(): audio record already open");
        return -EPERM;
    }

    mBufferSize = hw->getBufferSize(*pRate, AudioSystem::popCount(*pChannels));
    mDevices = devices;
    mFormat = AUDIO_HW_IN_FORMAT;
    mChannels = *pChannels;
    mSampleRate = *pRate;

    LOGD("set(): complete");
    return NO_ERROR;
}

ssize_t AudioStreamInMotorola::read( void* buffer, ssize_t bytes)
{
    LOGD("read(%p, %ld) called\n", buffer, bytes);

    if (!mHardware) {
        LOGE("read(): hardware is null, erroring out\n");
        return -1;
    }

    size_t count = bytes;
    uint8_t* p = static_cast<uint8_t*>(buffer);
    status_t status = NO_ERROR;

    if (mStandby) {
        LOGD("read(): input in standby, open device\n");

        {   // scope for the lock
            Mutex::Autolock lock(mHardware->mLock);
            LOGD("read(): acquire input wakelock");
            acquire_wake_lock(PARTIAL_WAKE_LOCK, kInputWakelockStr);

            // TODO: open truncate?

            // open audio input device
            status = ::open(CPCAP_DSP_CODEC, O_RDWR);
            if (status < 0) {
                LOGE("read(): cannot open %s errno: %d", CPCAP_DSP_CODEC, errno);
                LOGD("read(): release input wakelock");
                release_wake_lock(kInputWakelockStr);
                goto error;
            }
            mFd = status;
            mStandby = false;

            // set sample rate
            unsigned int rate = mSampleRate;
            LOGD("read(): setting DSP speed to %d", rate);
            status = ioctl(mFd, SNDCTL_DSP_SPEED, &rate);
            if (status < 0) {
                LOGE("read(): error setting DSP speed to %d: %d", rate, status);
                goto error;
            }

            // set channels
            int channels = AudioSystem::popCount(mChannels);
            LOGD("read(): setting DSP channels to %d", channels);
#ifdef USE_STEREO_IOCTL_FOR_CHANNELS
            status = ioctl(mFd, SNDCTL_DSP_STEREO, &channels);
#else
            status = ioctl(mFd, SNDCTL_DSP_CHANNELS, &channels);
#endif
            if (status < 0) {
                LOGE("read(): error setting DSP channels to %d: %d", channels, status);
                goto error;
            }
        }

        // TODO: figure out what the fuck to do here
        LOGE("read(): TODO: need to figure out how the fuck to do this part...");

//        mHardware->set_mRecordState(1);
        // make sure a1026 config is re-applied even is input device is not changed
        mHardware->clearCurDevice();
        mHardware->doRouting();

//        uint32_t acdb_id = mHardware->getACDB(MOD_REC, mHardware->get_snd_dev());
//        if (ioctl(mFd, AUDIO_START, &acdb_id)) {
//            LOGE("Error starting record");
//            goto Error;
//        }
    }

    while (count) {
        ssize_t bytesRead = ::read(mFd, buffer, count);
        if (bytesRead >= 0) {
            count -= bytesRead;
            p += bytesRead;
        } else {
            if (errno != EAGAIN) {
                status = bytesRead;
                goto error;
            }
            mRetryCount++;
            LOGD("read(): EAGAIN - retrying");
        }
    }
    LOGD("read(): read %ld bytes", bytes);

    return bytes;

error:
    standby();

    // Simulate audio input timing in case of error
    usleep((((bytes * 1000) / frameSize()) * 1000) / sampleRate());

    LOGE("read(): returning with error status %d", status);
    return status;
}

status_t AudioStreamInMotorola::standby()
{
    LOGD("standby() called");

    if (!mStandby) {
        LOGD("standby(): audioHardware PCM record is going to standby.");
        if (mFd >= 0) {
            ::close(mFd);
            mFd = -1;
        }
        LOGD("standby(): release input wakelock");
        release_wake_lock(kInputWakelockStr);

        mStandby = true;

        if (!mHardware) {
            LOGE("standby(): hardware reference is invalid.  erroring out");
            return -1;
        }

        LOGE("standby(): TODO: WTF?  need to figure this part out.");
        // TODO: WTF?
//        mHardware->set_mRecordState(0);
        // make sure a1026 config is re-applied even is input device is not changed
        mHardware->clearCurDevice();
        mHardware->doRouting();
    }

    return NO_ERROR;
}

bool AudioStreamInMotorola::checkStandby()
{
    LOGD("checkStandby() called");
    LOGD("checkStandby(): returning %d", (mStandby ? 1 : 0));
    return mStandby;
}

status_t AudioStreamInMotorola::dump(int fd, const Vector<String16>& args)
{
    const size_t SIZE = 256;
    char buffer[SIZE];
    String8 result;
    result.append("AudioStreamInMotorola::dump\n");
    snprintf(buffer, SIZE, "\tsample rate: %d\n", sampleRate());
    result.append(buffer);
    snprintf(buffer, SIZE, "\tbuffer size: %d\n", bufferSize());
    result.append(buffer);
    snprintf(buffer, SIZE, "\tchannels: %d\n", channels());
    result.append(buffer);
    snprintf(buffer, SIZE, "\tformat: %d\n", format());
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmHardware: %p\n", mHardware);
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmFd count: %d\n", mFd);
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmStandby: %d\n", mStandby);
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmRetryCount: %d\n", mRetryCount);
    result.append(buffer);
    ::write(fd, result.string(), result.size());
    return NO_ERROR;
}

status_t AudioStreamInMotorola::setParameters(const String8& keyValuePairs)
{
    AudioParameter param = AudioParameter(keyValuePairs);
    status_t status = NO_ERROR;
    int device;
    String8 key;
    int source;
    LOGD("setParameters(%s) called", keyValuePairs.string());

    // reading routing parameter
    key = String8(AudioParameter::keyRouting);
    if (param.getInt(key, device) == NO_ERROR) {
        LOGD("setParameters(): set input routing %x", device);
        if (device & (device - 1)) {
            LOGE("setParameters(): device value is invalid for routing");
            status = BAD_VALUE;
        } else {
            mDevices = device;
            status = mHardware->doRouting();
        }
        param.remove(key);
    }

    if (param.size()) {
        LOGE("setParameters(): parameter size is invalid");
        status = BAD_VALUE;
    }

    return status;
}

String8 AudioStreamInMotorola::getParameters(const String8& keys)
{
    AudioParameter param = AudioParameter(keys);
    String8 value;
    String8 key = String8(AudioParameter::keyRouting);

    if (param.get(key, value) == NO_ERROR) {
        param.addInt(key, (int)mDevices);
    }

    LOGD("getParameters(%s)", param.toString().string());
    return param.toString();
}

};
