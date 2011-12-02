#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=shadow

mkdir -p ../../../vendor/motorola/$DEVICE/proprietary
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/app
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/bin
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/etc
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/etc/firmware
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/lib
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/lib/hw
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/lib/egl
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/tts/lang_pico
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/usr/keychars
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/usr/keylayout
mkdir -p ../../../vendor/motorola/$DEVICE/proprietary/xbin

adb pull /system/bin/Hostapd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/SaveBPVer ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/akmd2 ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/ap_gain.bin ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/ap_gain_mmul.bin ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/batch ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/battd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/btcmd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/bthelp ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/bttest_mot ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/charge_only_mode ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/chat-ril ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/dbvc_atvc_property_set ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/dmt ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/dund ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/ecckeyd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/fdisk ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/firewall.sh ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/ftmipcd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/gkilogd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/loadpreinstalls.sh ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/mdm_panicd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/napics.sh ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/pppd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/pppd-ril ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/pvrsrvinit ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/secclkd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/smc_pa_ctrl ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/smoduled ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/startup_smc.sh ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/tcmd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/testpppd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/tstmetainfo ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/usbd ../../../vendor/motorola/$DEVICE/proprietary/bin
adb pull /system/bin/battd ../../../vendor/motorola/$DEVICE/proprietary/bin

adb pull /system/etc/amazon-kindle.properties ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/backup_targets.csv ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/cameraCalFileDef5M.bin ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/excluded-input-devices.xml ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/firmware/ap_bt_data.bin ../../../vendor/motorola/$DEVICE/proprietary/etc/firmware
adb pull /system/etc/firmware/wl1271.bin ../../../vendor/motorola/$DEVICE/proprietary/etc/firmware
adb pull /system/etc/fm_rx_init_1273.2.bts ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/fm_rx_init_6450.2.bts ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/fmc_init_1273.2.bts ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/fmc_init_6450.2.bts ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/ppp/peers/pppd-ril.options ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/priority_notifications_config.xml ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/security/mancacerts.zip ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/security/oprcacerts.zip ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/security/suplcerts.bks ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/smc_android_cfg.ini ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/smc_android_cfg_256.ini ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/smc_pa.ift ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/smc_pa_pk_4_ipa.bin ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/supportedlocales.conf ../../../vendor/motorola/$DEVICE/proprietary/etc
adb pull /system/etc/vzwpubagps.cer ../../../vendor/motorola/$DEVICE/proprietary/etc

adb pull /system/etc/wifi/fw_tiwlan_ap.bin ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/fw_wlan1271.bin ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/hostapd.conf.templet ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/tiwlan.ini ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/tiwlan_ap.ini ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/wpa_supplicant.conf ../../../vendor/motorola/$DEVICE/proprietary/etc/wifi

adb pull /system/lib/dsp/baseimage.dof ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/conversions.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/h264vdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/h264venc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/jpegenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/m4venc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mp3dec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mp4vdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mpeg4aacdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mpeg4aacenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/nbamrdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/nbamrenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/postprocessor_dualout.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/ringio.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/usn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wbamrdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wbamrenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wmadec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wmv9dec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary/lib/dsp

adb pull /system/lib/egl/libEGL_POWERVR_SGX530_125.so ../../../vendor/motorola/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so ../../../vendor/motorola/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libGLESv2_POWERVR_SGX530_125.so ../../../vendor/motorola/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libeglinfo.so ../../../vendor/motorola/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libgles1_texture_stream.so ../../../vendor/motorola/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libgles2_texture_stream.so ../../../vendor/motorola/$DEVICE/proprietary/lib/egl

adb pull /system/lib/hw/lights.shadow.so ../../../vendor/motorola/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/gps.shadow.so ../../../vendor/motorola/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/overlay.omap3.so ../../../vendor/motorola/$DEVICE/proprietary/lib/hw

adb pull /system/lib/libHPImgApi.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libIMGegl.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.AAC.decode.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.AMR.decode.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.MP3.decode.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.WBAMR.decode.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.WMA.decode.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libWifiAPHardware.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libarcsoftpe.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libarcsoft.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libbattd.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libcaps.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libcryptoki.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libdmengine.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libdmjavaplugin.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libglslcompiler.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libhostapd_client.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libimage_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libjanus.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libjanus_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmediaext.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmetainfo.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_atcmd.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_atcmd_mflex.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_bluetooth_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_btpan_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_led.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmotdrm1.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmotdrm1_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmoto_netutil.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmoto_ril.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmotodbgutils.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmotoims-sms.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmtp_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmtpstack.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libnativedrm1.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/liboemcamera.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libomx_arcomxcore_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libomx_qcelpdec_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libomx_qcelpenc_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpanorama.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpanorama_jni.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpkip.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpppd_plugin-ril.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpppd_plugin.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libprojectM.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libprovlib.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpvr2d.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpvrANDROID_WSEGL.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libscalado.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libsmapi.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libsrv_init.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libsrv_um.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libssmgr.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libtpa.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libtpa_core.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libui3d.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libvideoeditorlite.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libwbxmlparser.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libaudio.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libcamera.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libnmea.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libril_rds.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/librds_util.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libsmiledetect.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libsmiledetect.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libLCML.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libbridge.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libmoto_ril.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libpppd_plugin-ril.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libreference-ril.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libril.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libril_rds.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libbattd.so ../../../vendor/motorola/$DEVICE/proprietary/lib
adb pull /system/lib/libusc.so ../../../vendor/motorola/$DEVICE/proprietary/lib


adb pull /system/tts/lang_pico/en-US_lh0_sg.bin ../../../vendor/motorola/$DEVICE/proprietary/tts/lang_pico
adb pull /system/tts/lang_pico/en-US_ta.bin ../../../vendor/motorola/$DEVICE/proprietary/tts/lang_pico
adb pull /system/tts/lang_pico/es-ES_ta.bin ../../../vendor/motorola/$DEVICE/proprietary/tts/lang_pico
adb pull /system/tts/lang_pico/es-ES_zl0_sg.bin ../../../vendor/motorola/$DEVICE/proprietary/tts/lang_pico

adb pull /system/usr/keychars/cdma_shadow-keypad.kcm.bin ../../../vendor/motorola/$DEVICE/proprietary/usr/keychars

adb pull /system/usr/keylayout/cdma_shadow-keypad.kl ../../../vendor/motorola/$DEVICE/proprietary/usr/keylayout
adb pull /system/usr/keylayout/cpcap-key.kl ../../../vendor/motorola/$DEVICE/proprietary/usr/keylayout

adb pull /system/xbin/backup ../../../vendor/motorola/$DEVICE/proprietary/xbin
adb pull /system/xbin/drm1_func_test ../../../vendor/motorola/$DEVICE/proprietary/xbin
adb pull /system/xbin/run_backup ../../../vendor/motorola/$DEVICE/proprietary/xbin
adb pull /system/xbin/run_restore ../../../vendor/motorola/$DEVICE/proprietary/xbin
adb pull /system/xbin/ssmgrd ../../../vendor/motorola/$DEVICE/proprietary/xbin



(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/motorola/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/motorola/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmoto_gps.so:obj/lib/libmoto_gps.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libarcsoft.so:obj/lib/libarcsoft.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libaudio.so:obj/lib/libaudio.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libnmea.so:obj/lib/libnmea.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libril_rds.so:obj/lib/libril_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/librds_util.so:obj/lib/librds_util.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libsmiledetect.so:obj/lib/libsmiledetect.so

# All the blobs necessary for shadow
PRODUCT_COPY_FILES += \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmoto_gps.so:/system/lib/libmoto_gps.so \\
    vendor/motorola/__DEVICE__/proprietary/bin/Hostapd:/system/bin/Hostapd \\
    vendor/motorola/__DEVICE__/proprietary/bin/SaveBPVer:/system/bin/SaveBPVer \\
    vendor/motorola/__DEVICE__/proprietary/bin/akmd2:/system/bin/akmd2 \\
    vendor/motorola/__DEVICE__/proprietary/bin/ap_gain.bin:/system/bin/ap_gain.bin \\
    vendor/motorola/__DEVICE__/proprietary/bin/ap_gain_mmul.bin:/system/bin/ap_gain_mmul.bin \\
    vendor/motorola/__DEVICE__/proprietary/bin/batch:/system/bin/batch \\
    vendor/motorola/__DEVICE__/proprietary/bin/battd:/system/bin/battd \\
    vendor/motorola/__DEVICE__/proprietary/bin/btcmd:/system/bin/btcmd \\
    vendor/motorola/__DEVICE__/proprietary/bin/bthelp:/system/bin/bthelp \\
    vendor/motorola/__DEVICE__/proprietary/bin/bttest_mot:/system/bin/bttest_mot \\
    vendor/motorola/__DEVICE__/proprietary/bin/charge_only_mode:/system/bin/charge_only_mode \\
    vendor/motorola/__DEVICE__/proprietary/bin/chat-ril:/system/bin/chat-ril \\
    vendor/motorola/__DEVICE__/proprietary/bin/dbvc_atvc_property_set:/system/bin/dbvc_atvc_property_set \\
    vendor/motorola/__DEVICE__/proprietary/bin/dmt:/system/bin/dmt \\
    vendor/motorola/__DEVICE__/proprietary/bin/dund:/system/bin/dund \\
    vendor/motorola/__DEVICE__/proprietary/bin/ecckeyd:/system/bin/ecckeyd \\
    vendor/motorola/__DEVICE__/proprietary/bin/fdisk:/system/bin/fdisk \\
    vendor/motorola/__DEVICE__/proprietary/bin/firewall.sh:/system/bin/firewall.sh \\
    vendor/motorola/__DEVICE__/proprietary/bin/ftmipcd:/system/bin/ftmipcd \\
    vendor/motorola/__DEVICE__/proprietary/bin/gkilogd:/system/bin/gkilogd \\
    vendor/motorola/__DEVICE__/proprietary/bin/loadpreinstalls.sh:/system/bin/loadpreinstalls.sh \\
    vendor/motorola/__DEVICE__/proprietary/bin/mdm_panicd:/system/bin/mdm_panicd \\
    vendor/motorola/__DEVICE__/proprietary/bin/napics.sh:/system/bin/napics.sh \\
    vendor/motorola/__DEVICE__/proprietary/bin/pppd:/system/bin/pppd \\
    vendor/motorola/__DEVICE__/proprietary/bin/pppd-ril:/system/bin/pppd-ril \\
    vendor/motorola/__DEVICE__/proprietary/bin/pvrsrvinit:/system/bin/pvrsrvinit \\
    vendor/motorola/__DEVICE__/proprietary/bin/secclkd:/system/bin/secclkd \\
    vendor/motorola/__DEVICE__/proprietary/bin/smc_pa_ctrl:/system/bin/smc_pa_ctrl \\
    vendor/motorola/__DEVICE__/proprietary/bin/smoduled:/system/bin/smoduled \\
    vendor/motorola/__DEVICE__/proprietary/bin/startup_smc.sh:/system/bin/startup_smc.sh \\
    vendor/motorola/__DEVICE__/proprietary/bin/tcmd:/system/bin/tcmd \\
    vendor/motorola/__DEVICE__/proprietary/bin/testpppd:/system/bin/testpppd \\
    vendor/motorola/__DEVICE__/proprietary/bin/tstmetainfo:/system/bin/tstmetainfo \\
    vendor/motorola/__DEVICE__/proprietary/bin/usbd:/system/bin/usbd \\
    vendor/motorola/__DEVICE__/proprietary/etc/amazon-kindle.properties:/system/etc/amazon-kindle.properties \\
    vendor/motorola/__DEVICE__/proprietary/etc/backup_targets.csv:/system/etc/backup_targets.csv \\
    vendor/motorola/__DEVICE__/proprietary/etc/cameraCalFileDef5M.bin:/system/etc/cameraCalFileDef5M.bin \\
    vendor/motorola/__DEVICE__/proprietary/etc/excluded-input-devices.xml:/system/etc/excluded-input-devices.xml \\
    vendor/motorola/__DEVICE__/proprietary/etc/firmware/ap_bt_data.bin:/system/etc/firmware/ap_bt_data.bin \\
    vendor/motorola/__DEVICE__/proprietary/etc/firmware/wl1271.bin:/system/etc/firmware/wl1271.bin \\
    vendor/motorola/__DEVICE__/proprietary/etc/fm_rx_init_1273.2.bts:/system/etc/fm_rx_init_1273.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/etc/fm_rx_init_6450.2.bts:/system/etc/fm_rx_init_6450.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/etc/fmc_init_1273.2.bts:/system/etc/fmc_init_1273.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/etc/fmc_init_6450.2.bts:/system/etc/fmc_init_6450.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/etc/pppd-ril.options:/system/etc/ppp/peers/pppd-ril.options \\
    vendor/motorola/__DEVICE__/proprietary/etc/priority_notifications_config.xml:/system/etc/priority_notifications_config.xml \\
    vendor/motorola/__DEVICE__/proprietary/etc/mancacerts.zip:/system/etc/security/mancacerts.zip \\
    vendor/motorola/__DEVICE__/proprietary/etc/oprcacerts.zip:/system/etc/security/oprcacerts.zip \\
    vendor/motorola/__DEVICE__/proprietary/etc/suplcerts.bks:/system/etc/security/suplcerts.bks \\
    vendor/motorola/__DEVICE__/proprietary/etc/smc_android_cfg.ini:/system/etc/smc_android_cfg.ini \\
    vendor/motorola/__DEVICE__/proprietary/etc/smc_android_cfg_256.ini:/system/etc/smc_android_cfg_256.ini \\
    vendor/motorola/__DEVICE__/proprietary/etc/smc_pa.ift:/system/etc/smc_pa.ift \\
    vendor/motorola/__DEVICE__/proprietary/etc/smc_pa_pk_4_ipa.bin:/system/etc/smc_pa_pk_4_ipa.bin \\
    vendor/motorola/__DEVICE__/proprietary/etc/supportedlocales.conf:/system/etc/supportedlocales.conf \\
    vendor/motorola/__DEVICE__/proprietary/etc/vzwpubagps.cer:/system/etc/vzwpubagps.cer \\
    vendor/motorola/__DEVICE__/proprietary/etc/wifi/fw_tiwlan_ap.bin:/system/etc/wifi/fw_tiwlan_ap.bin \\
    vendor/motorola/__DEVICE__/proprietary/etc/wifi/fw_wlan1271.bin:/system/etc/wifi/fw_wlan1271.bin \\
    vendor/motorola/__DEVICE__/proprietary/etc/wifi/hostapd.conf.templet:/system/etc/wifi/hostapd.conf.templet \\
    vendor/motorola/__DEVICE__/proprietary/etc/wifi/tiwlan.ini:/system/etc/wifi/tiwlan.ini \\
    vendor/motorola/__DEVICE__/proprietary/etc/wifi/tiwlan_ap.ini:/system/etc/wifi/tiwlan_ap.ini \\
    vendor/motorola/__DEVICE__/proprietary/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/baseimage.dof:/system/lib/dsp/baseimage.dof \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/conversions.dll64P:/system/lib/dsp/conversions.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/h264vdec_sn.dll64P:/system/lib/dsp/h264vdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/h264venc_sn.dll64P:/system/lib/dsp/h264venc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/jpegenc_sn.dll64P:/system/lib/dsp/jpegenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/m4venc_sn.dll64P:/system/lib/dsp/m4venc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/mp3dec_sn.dll64P:/system/lib/dsp/mp3dec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/mp4vdec_sn.dll64P:/system/lib/dsp/mp4vdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/mpeg4aacdec_sn.dll64P:/system/lib/dsp/mpeg4aacdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/mpeg4aacenc_sn.dll64P:/system/lib/dsp/mpeg4aacenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/nbamrdec_sn.dll64P:/system/lib/dsp/nbamrdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/nbamrenc_sn.dll64P:/system/lib/dsp/nbamrenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/postprocessor_dualout.dll64P:/system/lib/dsp/postprocessor_dualout.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/ringio.dll64P:/system/lib/dsp/ringio.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/usn.dll64P:/system/lib/dsp/usn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/wbamrdec_sn.dll64P:/system/lib/dsp/wbamrdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/wbamrenc_sn.dll64P:/system/lib/dsp/wbamrenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/wmadec_sn.dll64P:/system/lib/dsp/wmadec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/dsp/wmv9dec_sn.dll64P:/system/lib/dsp/wmv9dec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX530_125.so:/system/lib/egl/libEGL_POWERVR_SGX530_125.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/egl/libeglinfo.so:/system/lib/egl/libeglinfo.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/egl/libgles1_texture_stream.so:/system/lib/egl/libgles1_texture_stream.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/egl/libgles2_texture_stream.so:/system/lib/egl/libgles2_texture_stream.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libHPImgApi.so:/system/lib/libHPImgApi.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libIMGegl.so:/system/lib/libIMGegl.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libOMX.TI.AAC.decode.so:/system/lib/libOMX.TI.AAC.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libOMX.TI.AMR.decode.so:/system/lib/libOMX.TI.AMR.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libOMX.TI.MP3.decode.so:/system/lib/libOMX.TI.MP3.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libOMX.TI.WBAMR.decode.so:/system/lib/libOMX.TI.WBAMR.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libOMX.TI.WMA.decode.so:/system/lib/libOMX.TI.WMA.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libWifiAPHardware.so:/system/lib/libWifiAPHardware.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libarcsoftpe.so:/system/lib/libarcsoftpe.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libarcsoft.so:/system/lib/libarcsoft.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libbattd.so:/system/lib/libbattd.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libcaps.so:/system/lib/libcaps.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libcryptoki.so:/system/lib/libcryptoki.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libdmengine.so:/system/lib/libdmengine.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libdmjavaplugin.so:/system/lib/libdmjavaplugin.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libglslcompiler.so:/system/lib/libglslcompiler.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libhostapd_client.so:/system/lib/libhostapd_client.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libimage_jni.so:/system/lib/libimage_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libjanus.so:/system/lib/libjanus.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libjanus_jni.so:/system/lib/libjanus_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmediaext.so:/system/lib/libmediaext.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmetainfo.so:/system/lib/libmetainfo.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmot_atcmd.so:/system/lib/libmot_atcmd.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmot_atcmd_mflex.so:/system/lib/libmot_atcmd_mflex.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmot_bluetooth_jni.so:/system/lib/libmot_bluetooth_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmot_btpan_jni.so:/system/lib/libmot_btpan_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmot_led.so:/system/lib/libmot_led.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmotdrm1.so:/system/lib/libmotdrm1.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmotdrm1_jni.so:/system/lib/libmotdrm1_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmoto_netutil.so:/system/lib/libmoto_netutil.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmoto_ril.so:/system/lib/libmoto_ril.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmotodbgutils.so:/system/lib/libmotodbgutils.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmotoims-sms.so:/system/lib/libmotoims-sms.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmtp_jni.so:/system/lib/libmtp_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmtpstack.so:/system/lib/libmtpstack.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libnativedrm1.so:/system/lib/libnativedrm1.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libomx_arcomxcore_sharedlibrary.so:/system/lib/libomx_arcomxcore_sharedlibrary.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpanorama.so:/system/lib/libpanorama.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpanorama_jni.so:/system/lib/libpanorama_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpkip.so:/system/lib/libpkip.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpppd_plugin-ril.so:/system/lib/libpppd_plugin-ril.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpppd_plugin.so:/system/lib/libpppd_plugin.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libprojectM.so:/system/lib/libprojectM.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libprovlib.so:/system/lib/libprovlib.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpvr2d.so:/system/lib/libpvr2d.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:/system/lib/libpvrANDROID_WSEGL.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libscalado.so:/system/lib/libscalado.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libsmapi.so:/system/lib/libsmapi.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libsrv_init.so:/system/lib/libsrv_init.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libsrv_um.so:/system/lib/libsrv_um.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libssmgr.so:/system/lib/libssmgr.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libtpa.so:/system/lib/libtpa.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libtpa_core.so:/system/lib/libtpa_core.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libui3d.so:/system/lib/libui3d.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libvideoeditorlite.so:/system/lib/libvideoeditorlite.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libwbxmlparser.so:/system/lib/libwbxmlparser.so \\
    vendor/motorola/__DEVICE__/proprietary/tts/lang_pico/en-US_lh0_sg.bin:/system/tts/lang_pico/en-US_lh0_sg.bin \\
    vendor/motorola/__DEVICE__/proprietary/tts/lang_pico/en-US_ta.bin:/system/tts/lang_pico/en-US_ta.bin \\
    vendor/motorola/__DEVICE__/proprietary/tts/lang_pico/es-ES_ta.bin:/system/tts/lang_pico/es-ES_ta.bin \\
    vendor/motorola/__DEVICE__/proprietary/tts/lang_pico/es-ES_zl0_sg.bin:/system/tts/lang_pico/es-ES_zl0_sg.bin \\
    vendor/motorola/__DEVICE__/proprietary/usr/keychars/cdma_shadow-keypad.kcm.bin:/system/usr/keychars/cdma_shadow-keypad.kcm.bin \\
    vendor/motorola/__DEVICE__/proprietary/usr/keychars/cdma_shadow-keypad.kcm.bin:/system/usr/keychars/qwerty.kcm.bin \\
    vendor/motorola/__DEVICE__/proprietary/usr/keychars/cdma_shadow-keypad.kcm.bin:/system/usr/keychars/qwerty2.kcm.bin \\
    vendor/motorola/__DEVICE__/proprietary/usr/keylayout/cdma_shadow-keypad.kl:/system/usr/keylayout/cdma_shadow-keypad.kl \\
    vendor/motorola/__DEVICE__/proprietary/usr/keylayout/cdma_shadow-keypad.kl:/system/usr/keylayout/qwerty.kl \\
    vendor/motorola/__DEVICE__/proprietary/usr/keylayout/cpcap-key.kl:/system/usr/keylayout/cpcap-key.kl \\
    vendor/motorola/__DEVICE__/proprietary/xbin/backup:/system/xbin/backup \\
    vendor/motorola/__DEVICE__/proprietary/xbin/drm1_func_test:/system/xbin/drm1_func_test \\
    vendor/motorola/__DEVICE__/proprietary/xbin/run_backup:/system/xbin/run_backup \\
    vendor/motorola/__DEVICE__/proprietary/xbin/run_restore:/system/xbin/run_restore \\
    vendor/motorola/__DEVICE__/proprietary/xbin/ssmgrd:/system/xbin/ssmgrd \\
    vendor/motorola/__DEVICE__/proprietary/lib/libaudio.so:/system/lib/libaudio.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libcamera.so:/system/lib/libcamera.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libnmea.so:/system/lib/libnmea.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libril_rds.so:/system/lib/libril_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/librds_util.so:/system/lib/librds_util.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libsmiledetect.so:/system/lib/libsmiledetect.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libbridge.so:/system/lib/libbridge.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libLCML.so:/system/lib/libLCML.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libmoto_ril.so:/system/lib/libmoto_ril.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libpppd_plugin-ril.so:/system/lib/libpppd_plugin-ril.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libreference-ril.so:/system/lib/libreference-ril.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libril.so:/system/lib/libril.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libril_rds.so:/system/lib/libril_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/libbattd.so:/system/lib/libattd.so \\
    vendor/motorola/__DEVICE__/proprietary/bin/battd.so:/system/bin/battd \\
    vendor/motorola/__DEVICE__/proprietary/lib/libusc.so:/system/lib/libusc.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/hw/lights.shadow.so:/system/lib/hw/lights.shadow.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/hw/gps.shadow.so:/system/lib/hw/gps.shadow.so \\
    vendor/motorola/__DEVICE__/proprietary/lib/hw/overlay.omap3.so:/system/lib/hw/overlay.omap3.so

EOF

./setup-makefiles.sh
