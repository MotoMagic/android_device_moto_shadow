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

#include <math.h>

//#define LOG_NDEBUG 0
#define LOG_TAG "AudioHardwareMotorola"

#include <utils/Log.h>
#include <utils/String8.h>
#include <hardware_legacy/power.h>

#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dlfcn.h>
#include <fcntl.h>

#include <cutils/properties.h>

#include <linux/soundcard.h>

#include "AudioHardwareMotorola.h"
#include <media/AudioRecord.h>
#include <media/mediarecorder.h>

// various device input/output configuration options
static const uint32_t SND_DEVICE_CURRENT                  = 256;
static const uint32_t SND_DEVICE_HANDSET                  = 0;
static const uint32_t SND_DEVICE_SPEAKER                  = 1;
static const uint32_t SND_DEVICE_BT                       = 2;
static const uint32_t SND_DEVICE_CARKIT                   = 3;
static const uint32_t SND_DEVICE_HEADSET                  = 4;
static const uint32_t SND_DEVICE_HEADSET_SPEAKER          = 5;
static const uint32_t SND_DEVICE_HEADSET_NO_MIC           = 6;
static const uint32_t SND_DEVICE_HANDSET_BACK_MIC         = 7;
static const uint32_t SND_DEVICE_SPEAKER_BACK_MIC         = 8;
static const uint32_t SND_DEVICE_HEADSET_NO_MIC_BACK_MIC  = 9;
static const uint32_t SND_DEVICE_HEADSET_SPEAKER_BACK_MIC = 10;

namespace android {
// ----------------------------------------------------------------------------

int AudioHardwareMotorola::MIXER_FD = -1;
int AudioHardwareMotorola::REF_COUNT = 0;

AudioHardwareMotorola::AudioHardwareMotorola() :
    mInit(false), mMicMute(true), mVoiceVolume(VOICE_VOLUME_MAX),
    mOutput(0)
{
    LOGD("AudioHardwareMotorola() called.");

    // first time opening, so open the mixer device
    if (AudioHardwareMotorola::REF_COUNT == 0) {
        LOGD("AudioHardwareMotorola(): opening the CPCAP mixer.");
        AudioHardwareMotorola::MIXER_FD = open(CPCAP_MIXER, O_RDWR);

        if (AudioHardwareMotorola::MIXER_FD < 0) {
            LOGE("AudioHardwareMotorola(): cannot open the CPCAP mixer.");
            return;
        }

        unsigned int gain = 10;
        LOGD("AudioHardwareMotorola(): setting audio gain to %d", gain);
        if (!ioctl(AudioHardwareMotorola::MIXER_FD, SOUND_MIXER_VOLUME, &gain)) {
            LOGE("AudioHardwareMotorola(): error setting audio gain to %d: %d", gain, errno);
        }
    }

    AudioHardwareMotorola::REF_COUNT++;

    mInit = true;

    LOGD("AudioHardwareMotorola(): initialized.  REF_COUNT = %d", AudioHardwareMotorola::REF_COUNT);
}

AudioHardwareMotorola::~AudioHardwareMotorola()
{
    LOGD("~AudioHardwareMotorola() called.");

    AudioHardwareMotorola::REF_COUNT--;

    // we're releasing our last reference, so close the mixer
    if (AudioHardwareMotorola::REF_COUNT == 0) {
        LOGD("~AudioHardwareMotorola(): closing the CPCAP mixer.");
        close(AudioHardwareMotorola::MIXER_FD);
    }

    for (size_t index = 0; index < mInputs.size(); index++) {
        closeInputStream((AudioStreamInMotorola*)mInputs[index]);
    }
    mInputs.clear();
    closeOutputStream((AudioStreamOutMotorola*)mOutput);
    mInit = false;

    LOGD("~AudioHardwareMotorola(): destroyed.  REF_COUNT = %d", AudioHardwareMotorola::REF_COUNT);
}

status_t AudioHardwareMotorola::initCheck()
{
    LOGD("initCheck() called.");
    LOGD("initCheck(): will return [%s]", (mInit ? "NO_ERROR" : "NO_INIT"));
    return mInit ? NO_ERROR : NO_INIT;
}

AudioStreamOut* AudioHardwareMotorola::openOutputStream(
        uint32_t devices, int *format, uint32_t *channels,
        uint32_t *sampleRate, status_t *status)
{
    LOGD("openOutputStream(%d, %d, %d, %d, %d) called",
            devices,
            (format == NULL ? -1 : *format),
            (channels == NULL ? -1 : *channels),
            (sampleRate == NULL ? -1 : *sampleRate),
            (status == NULL ? -1 : *status));

    { // scope for the lock
        Mutex::Autolock lock(mLock);

        // only one output stream allowed
        if (mOutput) {
            if (status) {
                *status = INVALID_OPERATION;
            }
            LOGE("openOutputStream(): only one output is permitted");
            return 0;
        }

        AudioStreamOutMotorola* out = new AudioStreamOutMotorola();
        status_t rc = out->set(this, devices, format, channels, sampleRate);
        if (status) {
            *status = rc;
        }
        if (rc == NO_ERROR) {
            mOutput = out;
        } else {
            LOGW("openOutputStream(): error setting output hardware parameters");
            delete out;
        }
    }

    return mOutput;
}

void AudioHardwareMotorola::closeOutputStream(AudioStreamOut* out)
{
    LOGD("closeOutputStream(%p) called", out);

    Mutex::Autolock lock(mLock);

    if (mOutput == 0 || mOutput != out) {
        LOGW("closeOutputStream(): attempt to close invalid output stream");
    } else {
        delete mOutput;
        mOutput = 0;
    }
}

AudioStreamIn* AudioHardwareMotorola::openInputStream(
        uint32_t devices, int *format, uint32_t *channels,
        uint32_t *sampleRate, status_t *status,
        AudioSystem::audio_in_acoustics acoustic_flags)
{
    LOGD("openInputStream(%d, %d, %d, %d, %d, %p) called",
            devices,
            (format == NULL ? -1 : *format),
            (channels == NULL ? -1 : *channels),
            (sampleRate == NULL ? -1 : *sampleRate),
            (status == NULL ? -1 : *status),
            &acoustic_flags);

    // check for valid input source
    if (!AudioSystem::isInputDevice((AudioSystem::audio_devices)devices)) {
        LOGE("openInputStream(): requested device is not valid: %d", devices);
        return 0;
    }

    // we use explicit instead of auto-lock here in case we error out
    // and need to unlock early
    mLock.lock();

    AudioStreamInMotorola* in = new AudioStreamInMotorola();
    status_t rc = in->set(this, devices, format, channels, sampleRate,
            acoustic_flags);
    if (status) {
        *status = rc;
    }
    if (rc != NO_ERROR) {
        LOGE("openInputStream(): error opening input stream: %d", rc);
        mLock.unlock();
        delete in;
        return 0;
    }

    mInputs.add(in);
    mLock.unlock();

    LOGD("openInputStream(): open completed, %d streams currently open", mInputs.size());
    return in;
}

void AudioHardwareMotorola::closeInputStream(AudioStreamIn* in)
{
    LOGD("closeInputStream(%p) called", in);

    Mutex::Autolock lock(mLock);

    ssize_t index = mInputs.indexOf((AudioStreamInMotorola *)in);
    if (index < 0) {
        LOGW("closeInputStream(): attempt to close invalid input stream");
    } else {
        mLock.unlock();
        delete mInputs[index];
        mLock.lock();
        mInputs.removeAt(index);

        LOGD("closeInputStream(): close completed, %d streams currently open", mInputs.size());
    }
}

status_t AudioHardwareMotorola::setMode(int mode)
{
    LOGD("setMode(%d) called", mode);

    int prev_mode = mMode;
    status_t status = AudioHardwareBase::setMode(mode);
    // TODO: is this needed?
    if (status == NO_ERROR) {
        if (((prev_mode != AudioSystem::MODE_IN_CALL) &&
                (mMode == AudioSystem::MODE_IN_CALL)) ||
            ((prev_mode == AudioSystem::MODE_IN_CALL) &&
                (mMode != AudioSystem::MODE_IN_CALL))) {
            LOGD("setMode(): switching in or out of a call, re-route devices");
            clearCurDevice();
        }
    }

    return status;
}

status_t AudioHardwareMotorola::setMicMute(bool state)
{
    LOGD("setMicMute(%d) called", (state ? 1 : 0));
    Mutex::Autolock lock(mLock);
    return setMicMute_l(state);
}

status_t AudioHardwareMotorola::setMicMute_l(bool state)
{
    LOGD("setMicMute_l(%d) called", (state ? 1 : 0));

    if (mMicMute != state) {
        LOGD("setMicMute_l(): mute state changed");

        mMicMute = state;

        // TODO: should i be using gains here?
        unsigned int gain = 0;

        if (!state) {
            gain = mVoiceVolume;
        }

        LOGD("setMicMute_l(): setting mic mute to %d", gain);
        if (ioctl(AudioHardwareMotorola::MIXER_FD, SOUND_MIXER_RECLEV, &gain)) {
            LOGE("setMicMute_l(): could not set mic mute on current device");
            return -1;
        }
    }
    return NO_ERROR;
}

status_t AudioHardwareMotorola::getMicMute(bool* state)
{
    LOGD("getMicMute(%p) called", state);
    LOGD("getMicMute(): returning %d", (mMicMute ? 1 : 0));
    *state = mMicMute;
    return NO_ERROR;
}

status_t AudioHardwareMotorola::setParameters(const String8& keyValuePairs)
{
    AudioParameter param = AudioParameter(keyValuePairs);
    String8 value;
    String8 key;

    LOGD("setParameters(%s) called", keyValuePairs.string());

    if (keyValuePairs.length() == 0) {
        LOGE("setParameters(): zero-length parameter string");
        return BAD_VALUE;
    }

#ifdef HAVE_FM_RADIO
    int devices;
    key = String8(AudioParameter::keyFmOn);
    if (param.getInt(key, devices) == NO_ERROR) {
        setFmOnOff(true);
    }
    key = String8(AudioParameter::keyFmOff);
    if (param.getInt(key, devices) == NO_ERROR) {
        setFmOnOff(false);
    }
#endif

    return NO_ERROR;
}

String8 AudioHardwareMotorola::getParameters(const String8& keys)
{
    AudioParameter request = AudioParameter(keys);
    AudioParameter reply = AudioParameter();

    LOGD("getParameters(%s) called", keys.string());
    LOGD("getParameters(): returning %s", reply.toString().string());
    return reply.toString();
}

size_t AudioHardwareMotorola::getInputBufferSize(uint32_t sampleRate,
        int format, int channelCount)
{
    LOGD("getInputBufferSize(%d, %d, %d) called", sampleRate, format, channelCount);

    if (format != AudioSystem::PCM_16_BIT) {
        LOGE("getInputBufferSize(): bad format: %d", format);
        return 0;
    }
    if (channelCount < 1 || channelCount > 2) {
        LOGE("getInputBufferSize(): bad channel count: %d", channelCount);
        return 0;
    }
    if (sampleRate < 8000 || sampleRate > 48000) {
        LOGE("getInputBufferSize(): bad sample rate: %d", sampleRate);
        return 0;
    }

    return getBufferSize(sampleRate, channelCount);
}

size_t AudioHardwareMotorola::getBufferSize(uint32_t sampleRate,
        int channelCount)
{
    LOGD("getBufferSize(%d, %d) called", sampleRate, channelCount);

    // TODO: check these
    size_t bufSize;

    if (sampleRate < 11025) {
        bufSize = 256;
    } else if (sampleRate < 22050) {
        bufSize = 512;
    } else if (sampleRate < 32000) {
        bufSize = 768;
    } else if (sampleRate < 44100) {
        bufSize = 1024;
    } else {
        bufSize = 1536;
    }

    LOGD("getBufferSize(): will return %d", bufSize * channelCount);
    return 8192;
//    return bufSize * channelCount;
}

#ifdef HAVE_FM_RADIO
status_t AudioHardwareMotorola::setFmOnOff(bool onoff)
{
    // TODO: IMPLEMENT
    return NO_ERROR;
}
#endif

status_t AudioHardwareMotorola::setVoiceVolume_l(uint32_t volume)
{
    LOGD("setVoiceVolume_l(%d) called", volume);

    unsigned int gain = volume;
    LOGD("setVoiceVolume_l(): setting in-call gain to %d", gain);

    if (ioctl(AudioHardwareMotorola::MIXER_FD, SOUND_MIXER_RECLEV, &gain)) {
        LOGE("setVoiceVolume_l(): cannot set volume on current device");
    }
    return NO_ERROR;
}

// TODO: double-check this
status_t AudioHardwareMotorola::setVoiceVolume(float v)
{
    LOGD("setVoiceVolume(%f) called", v);

    if (v < 0.0) {
        LOGW("setVoiceVolume(): %f is under 0.0, assuming 0.0", v);
        v = 0.0;
    } else if (v > 1.0) {
        LOGW("setVoiceVolume(): %f is over 1.0, assuming 1.0", v);
        v = 1.0;
    }

    int vol = lrint(v * VOICE_VOLUME_MAX);

    Mutex::Autolock lock(mLock);
    LOGD("setVoiceVolume(): voice volume %d (range is 0 to %d)", vol, VOICE_VOLUME_MAX);
    setVoiceVolume_l(vol); //always set current device
    mVoiceVolume = vol;
    return NO_ERROR;
}

status_t AudioHardwareMotorola::setMasterVolume(float v)
{
    LOGD("setMasterVolume(%f) called", v);
    // We return an error code here to let the audioflinger do in-software
    // volume on top of the maximum volume that we set through the SND API.
    // return error - software mixer will handle it
    return -1;
}

#ifdef HAVE_FM_RADIO
status_t AudioHardwareMotorola::setFmVolume(float v)
{
    LOGD("setFmVolume(%f) called", vol);
    // TODO: IMPLEMENT
    int vol = AudioSystem::logToLinear(v);
    return NO_ERROR;
}
#endif

// TODO: this needs to be finished
status_t AudioHardwareMotorola::doRouting()
{
    LOGD("doRouting() called");

    Mutex::Autolock lock(mLock);
    uint32_t outputDevices = mOutput->devices();
    status_t ret = NO_ERROR;
    AudioStreamInMotorola *input = getActiveInput_l();
    uint32_t inputDevice = (input == NULL) ? 0 : input->devices();
    int sndDevice = -1;

    // TODO: double check all of this
    if (sndDevice == -1 && inputDevice != 0) {
        LOGD("doRouting(): do input routing device %x", inputDevice);
        if (inputDevice & AudioSystem::DEVICE_IN_BLUETOOTH_SCO_HEADSET) {
            LOGD("doRouting(): routing audio to Bluetooth PCM");
            sndDevice = SND_DEVICE_BT;
        } else if (inputDevice & AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_CARKIT) {
            LOGD("doRouting(): routing audio to Bluetooth car kit");
            sndDevice = SND_DEVICE_CARKIT;
        } else if (inputDevice & AudioSystem::DEVICE_IN_WIRED_HEADSET) {
            if ((outputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADSET) &&
                    (outputDevices & AudioSystem::DEVICE_OUT_SPEAKER)) {
                        LOGD("doRouting(): routing audio to Wired Headset and Speaker");
                        sndDevice = SND_DEVICE_HEADSET_SPEAKER;
            } else {
                LOGD("doRouting(): routing audio to Wired Headset");
                sndDevice = SND_DEVICE_HEADSET;
            }
        } else if (inputDevice & AudioSystem::DEVICE_IN_BACK_MIC) {
            if (outputDevices & (AudioSystem:: DEVICE_OUT_WIRED_HEADSET) &&
                   (outputDevices & AudioSystem:: DEVICE_OUT_SPEAKER)) {
                LOGD("doRouting(): routing audio to Wired Headset and Speaker with back mic");
                sndDevice = SND_DEVICE_HEADSET_SPEAKER_BACK_MIC;
            } else if (outputDevices & AudioSystem::DEVICE_OUT_SPEAKER) {
                LOGD("doRouting(): routing audio to Speakerphone with back mic");
                sndDevice = SND_DEVICE_SPEAKER_BACK_MIC;
            } else if (outputDevices == AudioSystem::DEVICE_OUT_EARPIECE) {
                LOGD("doRouting(): routing audio to Handset with back mic");
                sndDevice = SND_DEVICE_HANDSET_BACK_MIC;
            } else {
                LOGD("doRouting(): routing audio to Headset with back mic");
                sndDevice = SND_DEVICE_HEADSET_NO_MIC_BACK_MIC;
            }
        } else {
            if (outputDevices & AudioSystem::DEVICE_OUT_SPEAKER) {
                LOGD("doRouting(): routing audio to Speakerphone");
                sndDevice = SND_DEVICE_SPEAKER;
            } else if (outputDevices == AudioSystem::DEVICE_OUT_WIRED_HEADPHONE) {
                LOGD("doRouting(): routing audio to Headset");
                sndDevice = SND_DEVICE_HEADSET_NO_MIC;
            } else {
                LOGD("doRouting(): routing audio to Handset");
                sndDevice = SND_DEVICE_HANDSET;
            }
        }
    }

    // if inputDevice == 0, restore output routing
    if (sndDevice == -1) {
        if (outputDevices & (outputDevices - 1)) {
            if ((outputDevices & AudioSystem::DEVICE_OUT_SPEAKER) == 0) {
                LOGW("doRouting(): Hardware does not support requested route combination (%#X),"
                        " picking closest possible route...", outputDevices);
            }
        }

        if (outputDevices &
                (AudioSystem::DEVICE_OUT_BLUETOOTH_SCO | AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_HEADSET)) {
            LOGD("doRouting(): routing audio to Bluetooth PCM");
            sndDevice = SND_DEVICE_BT;
        } else if (outputDevices & AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_CARKIT) {
            LOGD("doRouting(): routing audio to Bluetooth PCM Carkit");
            sndDevice = SND_DEVICE_CARKIT;
        } else if ((outputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADSET) &&
                (outputDevices & AudioSystem::DEVICE_OUT_SPEAKER)) {
            LOGD("doRouting(): routing audio to Wired Headset and Speaker");
            sndDevice = SND_DEVICE_HEADSET_SPEAKER;
        } else if (outputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADPHONE) {
            if (outputDevices & AudioSystem::DEVICE_OUT_SPEAKER) {
                LOGD("doRouting(): routing audio to Wired Headphones and Speaker");
                sndDevice = SND_DEVICE_HEADSET_SPEAKER;
            } else {
                LOGD("doRouting(): routing audio to Wired Headphones w/o Mic");
                sndDevice = SND_DEVICE_HEADSET_NO_MIC;
            }
        } else if (outputDevices & AudioSystem::DEVICE_OUT_WIRED_HEADSET) {
            LOGD("doRouting(): routing audio to Wired Headset");
            sndDevice = SND_DEVICE_HEADSET;
        } else if (outputDevices & AudioSystem::DEVICE_OUT_SPEAKER) {
            LOGD("doRouting(): routing audio to Speakerphone");
            sndDevice = SND_DEVICE_SPEAKER;
        } else {
            LOGD("doRouting(): routing audio to Handset");
            sndDevice = SND_DEVICE_HANDSET;
        }
    }

    // TODO: do the actual audio route here
    LOGE("doRouting(): TODO: need to implement routing");
    int spkr = SOUND_MASK_SPEAKER;
    LOGD("doRouting(): routing output to %x", spkr);
    if (!ioctl(AudioHardwareMotorola::MIXER_FD, SOUND_MIXER_OUTSRC, &spkr)) {
        LOGE("doRouting(): error routing output to %x: %d", spkr, errno);
    }

    return ret;
}

status_t AudioHardwareMotorola::dumpInternals(int fd,
        const Vector<String16>& args)
{
    const size_t SIZE = 256;
    char buffer[SIZE];
    String8 result;
    result.append("AudioHardware::dumpInternals\n");
    snprintf(buffer, SIZE, "\tmInit: %s\n", mInit? "true": "false");
    result.append(buffer);
    snprintf(buffer, SIZE, "\tmMicMute: %s\n", mMicMute? "true": "false");
    result.append(buffer);
    ::write(fd, result.string(), result.size());
    return NO_ERROR;
}

status_t AudioHardwareMotorola::dump(int fd, const Vector<String16>& args)
{
    dumpInternals(fd, args);
    for (size_t index = 0; index < mInputs.size(); index++) {
        mInputs[index]->dump(fd, args);
    }

    if (mOutput) {
        mOutput->dump(fd, args);
    }
    return NO_ERROR;
}

AudioStreamInMotorola *AudioHardwareMotorola::getActiveInput_l()
{
    LOGD("getActiveInput_l() called");

    for (size_t index = 0; index < mInputs.size(); index++) {
        // return first input found not being in standby mode
        // as only one input can be in this state
        if (!mInputs[index]->checkStandby()) {
            LOGD("getActiveInput_l(): returning active input");
            return mInputs[index];
        }
    }

    LOGD("getActiveInput_l(): no active inputs found");
    return NULL;
}

extern "C" AudioHardwareInterface* createAudioHardware(void) {
    return new AudioHardwareMotorola();
}

}; // namespace android
