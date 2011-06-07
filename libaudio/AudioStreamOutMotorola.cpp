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

//#define LOG_NDEBUG 0
#define LOG_TAG "AudioStreamOutMotorola"
#include <stdint.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/soundcard.h>

#include <hardware_legacy/power.h>
#include <hardware_legacy/AudioHardwareInterface.h>

#include "AudioHardwareMotorola.h"

namespace android {
// ----------------------------------------------------------------------------

// ID string for audio wakelock
static const char kOutputWakelockStr[] = "AudioHardwareMotorolaOut";

static int errCount = 0;

AudioStreamOutMotorola::AudioStreamOutMotorola() :
        mHardware(0), mFd(-1), mStartCount(0), mRetryCount(0), mStandby(true),
        mDevices(0), mChannels(AUDIO_HW_OUT_CHANNELS), mSampleRate(AUDIO_HW_OUT_SAMPLERATE),
        mBufferSize(AUDIO_HW_OUT_BUFSZ)
{
    LOGD("AudioStreamOutMotorola() called");
}

AudioStreamOutMotorola::~AudioStreamOutMotorola()
{
    LOGD("~AudioStreamOutMotorola() called");
    standby();
}

status_t AudioStreamOutMotorola::set(
        AudioHardwareMotorola* hw, uint32_t devices, int* pFormat, uint32_t* pChannels,
        uint32_t* pRate)
{
    int lFormat = pFormat ? *pFormat : 0;
    uint32_t lChannels = pChannels ? *pChannels : 0;
    uint32_t lRate = pRate ? *pRate : 0;

    LOGD("set(%p, %x, %d, %x, %d) called", hw, devices, lFormat, lChannels, lRate);

    mHardware = hw;
    mDevices = devices;

    // fix up defaults
    if (lFormat == 0) lFormat = format();
    if (lChannels == 0) lChannels = channels();
    if (lRate == 0) lRate = sampleRate();

    // check values
    if ((lFormat != format()) ||
            (lChannels != channels()) ||
            (lRate != sampleRate())) {
        if (pFormat) *pFormat = format();
        if (pChannels) *pChannels = channels();
        if (pRate) *pRate = sampleRate();
        LOGD("set(): invalid stream values.  expected: (%d, %d, %d)", format(), channels(), sampleRate());
        return BAD_VALUE;
    }

    if (pFormat) *pFormat = lFormat;
    if (pChannels) *pChannels = lChannels;
    if (pRate) *pRate = lRate;

    mChannels = lChannels;
    mSampleRate = lRate;
    mBufferSize = hw->getBufferSize(lRate, AudioSystem::popCount(lChannels));

    return NO_ERROR;
}

ssize_t AudioStreamOutMotorola::write(const void* buffer, size_t bytes)
{
    LOGD("write(%p, %d) called", buffer, bytes);
    status_t status = NO_INIT;
    size_t count = bytes;
    const uint8_t* p = static_cast<const uint8_t*>(buffer);

    if (mStandby) {
        LOGD("write(): acquire output wakelock");
        acquire_wake_lock(PARTIAL_WAKE_LOCK, kOutputWakelockStr);

        LOGE("write(): TODO: need to determine phone mode vs stac mode");
        // TODO: open O_TRUNC to open in "phone mode", whatever that is
        // TODO: STDAC or CODEC????

        // open driver
        LOGD("write(): open stdac pcm driver");
        status = ::open(CPCAP_DSP_STDAC, O_WRONLY);
        if (status < 0) {
            if (errCount++ < 10) {
                LOGE("write(): cannot open stdac errno: %d", errno);
            }
            release_wake_lock(kOutputWakelockStr);
            goto error;
        }
        mFd = status;
        mStandby = false;

        // set sample rate
        unsigned int rate = mSampleRate;
        LOGD("write(): setting DSP speed to %d", rate);
        status = ioctl(mFd, SNDCTL_DSP_SPEED, &rate);
        if (status < 0) {
            LOGE("write(): error setting DSP speed to %d: %d", rate, status);
            goto error;
        }

        // set channels
        int channels = AudioSystem::popCount(mChannels);
        LOGD("write(): setting DSP channels to %d", channels);
#ifdef USE_STEREO_IOCTL_FOR_CHANNELS
        status = ioctl(mFd, SNDCTL_DSP_STEREO, &channels);
#else
        status = ioctl(mFd, SNDCTL_DSP_CHANNELS, &channels);
#endif
        if (status < 0) {
            LOGE("write(): error setting DSP channels to %d: %d", channels, status);
            goto error;
        }

        // TODO: volume?
        LOGE("write(): TODO: need to set volume?");
    }


    while (count) {
        ssize_t written = ::write(mFd, p, count);
        if (written >= 0) {
            count -= written;
            p += written;
        } else {
            if (errno != EAGAIN) {
                status = written;
                goto error;
            }
            mRetryCount++;
            LOGD("write(): EAGAIN - retry");
        }
    }

    LOGD("write(): wrote %d bytes", bytes);
    return bytes;

error:
    standby();

    // simulate audio output timing in case of error
    usleep((((bytes * 1000) / frameSize()) * 1000) / sampleRate());

    LOGE("write(): exiting with error status %d", status);
    return status;
}

status_t AudioStreamOutMotorola::standby()
{
    LOGD("standby() called");

    if (!mStandby) {
        LOGD("standby(): pcm playback is going into standby");
        if (mFd >= 0) {
            ::close(mFd);
            mFd = -1;
        }
        LOGD("standby(): release output wakelock");
        release_wake_lock(kOutputWakelockStr);
        mStandby = true;
    }
    return NO_ERROR;
}

bool AudioStreamOutMotorola::checkStandby()
{
    LOGD("checkStandby() called");
    LOGD("checkStandby(): returning %d", (mStandby ? 1 : 0));
    return mStandby;
}

status_t AudioStreamOutMotorola::dump(int fd, const Vector<String16>& args)
{
    const size_t SIZE = 256;
    char buffer[SIZE];
    String8 result;
    result.append("AudioStreamOutMotorola::dump\n");
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
    snprintf(buffer, SIZE, "\tmFd: %d\n", mFd);
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmStartCount: %d\n", mStartCount);
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmRetryCount: %d\n", mRetryCount);
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmStandby: %s\n", mStandby? "true": "false");
    result.append(buffer);
    ::write(fd, result.string(), result.size());
    return NO_ERROR;
}

status_t AudioStreamOutMotorola::setParameters(const String8& keyValuePairs)
{
    AudioParameter param = AudioParameter(keyValuePairs);
    String8 key = String8(AudioParameter::keyRouting);
    status_t status = NO_ERROR;
    int device;
    LOGD("setParameters(%s) called", keyValuePairs.string());

    if (param.getInt(key, device) == NO_ERROR) {
        mDevices = device;
        LOGD("setParameters(): set output routing %x", mDevices);
        status = mHardware->doRouting();

        // TODO: after doing routing, we may need to re-open the dsp

        param.remove(key);
    }

    if (param.size()) {
        status = BAD_VALUE;
    }
    return status;
}

String8 AudioStreamOutMotorola::getParameters(const String8& keys)
{
    AudioParameter param = AudioParameter(keys);
    String8 value;
    String8 key = String8(AudioParameter::keyRouting);

    if (param.get(key, value) == NO_ERROR) {
        LOGD("getParameters(): get routing %x", mDevices);
        param.addInt(key, (int)mDevices);
    }

    LOGD("getParameters(%s)", param.toString().string());
    return param.toString();
}

status_t AudioStreamOutMotorola::getRenderPosition(uint32_t *dspFrames)
{
    LOGD("getRenderPosition(%d) called", (dspFrames == NULL ? 0 : *dspFrames));
    LOGE("getRenderPosition(): TODO: implement this");
    //TODO: enable when supported by driver
    return INVALID_OPERATION;
}

};
