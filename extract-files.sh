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
adb pull /system/app/PhoneConfig.apk ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/app/ProgramMenu.apk ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/app/ProgramMenuSystem.apk ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/Hostapd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/SaveBPVer ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/akmd2 ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/ap_gain.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/ap_gain_mmul.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/batch ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/battd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/btcmd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/bthelp ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/bttest_mot ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/charge_only_mode ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/chat-ril ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/dbvc_atvc_property_set ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/dlnasrv ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/dmt ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/dund ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/ecckeyd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/factory_reset ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/fdisk ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/firewall.sh ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/fmradioserver ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/ftmipcd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/gkilogd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/loadpreinstalls.sh ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/mdm_panicd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/modemlog ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/napics.sh ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/pppd-ril ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/pvrsrvinit ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/secclkd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/smc_pa_ctrl ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/smoduled ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/startup_smc.sh ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/tcmd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/tcmdhelp ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/testpppd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/ti_config_adc.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/tstmetainfo ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/bin/usbd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/amazon-kindle.properties ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/arcplayer.cfg ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/backup_targets.csv ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/cameraCalFileDef5M.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/cameraCalFileDef8M.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/contextawareness/algorithm.xml ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/excluded-input-devices.xml ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/firmware/ap_bt_data.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/firmware/wl1271.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/fm_rx_init_1273.2.bts ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/fm_rx_init_6450.2.bts ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/fmc_init_1273.2.bts ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/fmc_init_6450.2.bts ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/ppp/peers/pppd-ril.options ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/priority_notifications_config.xml ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/pvextensions.cfg ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/pvplayer_mot.cfg ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/security/mancacerts.zip ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/security/oprcacerts.zip ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/security/suplcerts.bks ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/smc_android_cfg.ini ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/smc_android_cfg_256.ini ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/smc_pa.ift ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/smc_pa_pk_4_ipa.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/supportedlocales.conf ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/vzwpubagps.cer ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/wifi/fw_tiwlan_ap.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/wifi/fw_wlan1271.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/wifi/hostapd.conf.templet ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/wifi/tiwlan.ini ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/wifi/tiwlan_ap.ini ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/etc/wifi/wpa_supplicant.conf ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/720p_h264vdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/720p_mp4vdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/720p_mp4venc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/baseimage.dof ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/conversions.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/h264vdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/h264venc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/jpegenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/m4venc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/mp3dec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/mp4vdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/mpeg4aacdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/mpeg4aacenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/nbamrdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/nbamrenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/postprocessor_dualout.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/ringio.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/usn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/wbamrdec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/wbamrenc_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/wmadec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/dsp/wmv9dec_sn.dll64P ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/egl/libEGL_POWERVR_SGX530_125.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv2_POWERVR_SGX530_125.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/egl/libeglinfo.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/egl/libgles1_texture_stream.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/egl/libgles2_texture_stream.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/hw/gestures.shadow.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/hw/gralloc.omap3.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libFMRadio.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libHPImgApi.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libIMGegl.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libMynetNativeJni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.720P.Decoder.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.720P.Encoder.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.AAC.decode.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.AMR.decode.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.MP3.decode.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.WBAMR.decode.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.WMA.decode.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libOMX.TI.mp4.splt.Encoder.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libSwypeCore.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libWifiAPHardware.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libWifiAPNativeJni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libarcsoftpe.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libbattd.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libcaps.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libcryptoki.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libdlnahttpjni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libdlnajni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libdlnaprofileparser.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libdlnasysjni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libdmengine.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libdmjavaplugin.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libextdisp.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libfmradio_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libfmradioplayer.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libglslcompiler.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libhdmi.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libhostapd_client.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libimage_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libjanus.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libjanus_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libkpt-review.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmediaext.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmetainfo.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmot_atcmd.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmot_atcmd_mflex.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmot_bluetooth_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmot_btpan_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmot_led.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmotdrm1.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmotdrm1_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmoto_netutil.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmoto_ril.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmotodbgutils.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmotoims-sms.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmotprojectM.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmtp_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libmtpstack.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libnativedrm1.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/liboemcamera.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libomx_arcomxcore_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libomx_evrcdec_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libomx_qcelpdec_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libomx_qcelpenc_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libomx_wmadec_sharedlibrary.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libopencore_arcaudiolocal.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libopencore_arcaudiolocalreg.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libopencore_motlocal.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libopencore_motlocalreg.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libopencore_motojanusreg.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libopencore_motoma1.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpanorama.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpanorama_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpkip.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpppd_plugin-ril.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpppd_plugin.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libprojectM.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libprovlib.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpvgetmetadata_extn.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpvr2d.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libpvrANDROID_WSEGL.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libscalado.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libsmapi.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libsrv_init.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libsrv_um.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libssmgr.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libtpa.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libtpa_core.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libui3d.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libvideoeditorlite.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libvisualization_jni.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libvsuite_sharedlib.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libwbxmlparser.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/ulogd_BASE.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/ulogd_SQLITE3.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/tts/lang_pico/en-US_lh0_sg.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/tts/lang_pico/en-US_ta.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/tts/lang_pico/es-ES_ta.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/tts/lang_pico/es-ES_zl0_sg.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/usr/keychars/cdma_shadow-keypad.kcm.bin ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/usr/keylayout/cdma_shadow-keypad.kl ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/usr/keylayout/cpcap-key.kl ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/xbin/backup ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/xbin/drm1_func_test ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/xbin/pppd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/xbin/run_backup ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/xbin/run_restore ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/xbin/ssmgrd ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libcamera.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libnmea.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libril_rds.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libgps_rds.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libsmiledetect.so ../../../vendor/motorola/$DEVICE/proprietary
adb pull /system/lib/libarcsoft.so ../../../vendor/motorola/$DEVICE/proprietary

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
    vendor/motorola/__DEVICE__/proprietary/libarcsoft.so:obj/lib/libarcsoft.so \\
    vendor/motorola/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so \\
    vendor/motorola/__DEVICE__/proprietary/libgps_rds.so:obj/lib/libgps_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/libnmea.so:obj/lib/libnmea.so \\
    vendor/motorola/__DEVICE__/proprietary/libril_rds.so:obj/lib/libril_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/libsmiledetect.so:obj/lib/libsmiledetect.so \\
    vendor/motorola/__DEVICE__/proprietary/gralloc.omap3.so:obj/lib/hw/gralloc.omap3.so

PRODUCT_COPY_FILES += \\
    vendor/motorola/__DEVICE__/proprietary/PhoneConfig.apk:/system/app/PhoneConfig.apk \\
    vendor/motorola/__DEVICE__/proprietary/ProgramMenu.apk:/system/app/ProgramMenu.apk \\
    vendor/motorola/__DEVICE__/proprietary/ProgramMenuSystem.apk:/system/app/ProgramMenuSystem.apk \\

# All the blobs necessary for shadow
PRODUCT_COPY_FILES += \\
    vendor/motorola/__DEVICE__/proprietary/Hostapd:/system/bin/Hostapd \\
    vendor/motorola/__DEVICE__/proprietary/SaveBPVer:/system/bin/SaveBPVer \\
    vendor/motorola/__DEVICE__/proprietary/akmd2:/system/bin/akmd2 \\
    vendor/motorola/__DEVICE__/proprietary/ap_gain.bin:/system/bin/ap_gain.bin \\
    vendor/motorola/__DEVICE__/proprietary/ap_gain_mmul.bin:/system/bin/ap_gain_mmul.bin \\
    vendor/motorola/__DEVICE__/proprietary/batch:/system/bin/batch \\
    vendor/motorola/__DEVICE__/proprietary/battd:/system/bin/battd \\
    vendor/motorola/__DEVICE__/proprietary/btcmd:/system/bin/btcmd \\
    vendor/motorola/__DEVICE__/proprietary/bthelp:/system/bin/bthelp \\
    vendor/motorola/__DEVICE__/proprietary/bttest_mot:/system/bin/bttest_mot \\
    vendor/motorola/__DEVICE__/proprietary/charge_only_mode:/system/bin/charge_only_mode \\
    vendor/motorola/__DEVICE__/proprietary/chat-ril:/system/bin/chat-ril \\
    vendor/motorola/__DEVICE__/proprietary/dbvc_atvc_property_set:/system/bin/dbvc_atvc_property_set \\
    vendor/motorola/__DEVICE__/proprietary/dlnasrv:/system/bin/dlnasrv \\
    vendor/motorola/__DEVICE__/proprietary/dmt:/system/bin/dmt \\
    vendor/motorola/__DEVICE__/proprietary/dund:/system/bin/dund \\
    vendor/motorola/__DEVICE__/proprietary/ecckeyd:/system/bin/ecckeyd \\
    vendor/motorola/__DEVICE__/proprietary/factory_reset:/system/bin/factory_reset \\
    vendor/motorola/__DEVICE__/proprietary/fdisk:/system/bin/fdisk \\
    vendor/motorola/__DEVICE__/proprietary/firewall.sh:/system/bin/firewall.sh \\
    vendor/motorola/__DEVICE__/proprietary/fmradioserver:/system/bin/fmradioserver \\
    vendor/motorola/__DEVICE__/proprietary/ftmipcd:/system/bin/ftmipcd \\
    vendor/motorola/__DEVICE__/proprietary/gkilogd:/system/bin/gkilogd \\
    vendor/motorola/__DEVICE__/proprietary/loadpreinstalls.sh:/system/bin/loadpreinstalls.sh \\
    vendor/motorola/__DEVICE__/proprietary/mdm_panicd:/system/bin/mdm_panicd \\
    vendor/motorola/__DEVICE__/proprietary/modemlog:/system/bin/modemlog \\
    vendor/motorola/__DEVICE__/proprietary/napics.sh:/system/bin/napics.sh \\
    vendor/motorola/__DEVICE__/proprietary/pppd-ril:/system/bin/pppd-ril \\
    vendor/motorola/__DEVICE__/proprietary/pvrsrvinit:/system/bin/pvrsrvinit \\
    vendor/motorola/__DEVICE__/proprietary/secclkd:/system/bin/secclkd \\
    vendor/motorola/__DEVICE__/proprietary/smc_pa_ctrl:/system/bin/smc_pa_ctrl \\
    vendor/motorola/__DEVICE__/proprietary/smoduled:/system/bin/smoduled \\
    vendor/motorola/__DEVICE__/proprietary/startup_smc.sh:/system/bin/startup_smc.sh \\
    vendor/motorola/__DEVICE__/proprietary/tcmd:/system/bin/tcmd \\
    vendor/motorola/__DEVICE__/proprietary/tcmdhelp:/system/bin/tcmdhelp \\
    vendor/motorola/__DEVICE__/proprietary/testpppd:/system/bin/testpppd \\
    vendor/motorola/__DEVICE__/proprietary/ti_config_adc.bin:/system/bin/ti_config_adc.bin \\
    vendor/motorola/__DEVICE__/proprietary/tstmetainfo:/system/bin/tstmetainfo \\
    vendor/motorola/__DEVICE__/proprietary/usbd:/system/bin/usbd \\
    vendor/motorola/__DEVICE__/proprietary/amazon-kindle.properties:/system/etc/amazon-kindle.properties \\
    vendor/motorola/__DEVICE__/proprietary/arcplayer.cfg:/system/etc/arcplayer.cfg \\
    vendor/motorola/__DEVICE__/proprietary/backup_targets.csv:/system/etc/backup_targets.csv \\
    vendor/motorola/__DEVICE__/proprietary/cameraCalFileDef5M.bin:/system/etc/cameraCalFileDef5M.bin \\
    vendor/motorola/__DEVICE__/proprietary/cameraCalFileDef8M.bin:/system/etc/cameraCalFileDef8M.bin \\
    vendor/motorola/__DEVICE__/proprietary/algorithm.xml:/system/etc/contextawareness/algorithm.xml \\
    vendor/motorola/__DEVICE__/proprietary/excluded-input-devices.xml:/system/etc/excluded-input-devices.xml \\
    vendor/motorola/__DEVICE__/proprietary/ap_bt_data.bin:/system/etc/firmware/ap_bt_data.bin \\
    vendor/motorola/__DEVICE__/proprietary/wl1271.bin:/system/etc/firmware/wl1271.bin \\
    vendor/motorola/__DEVICE__/proprietary/fm_rx_init_1273.2.bts:/system/etc/fm_rx_init_1273.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/fm_rx_init_6450.2.bts:/system/etc/fm_rx_init_6450.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/fmc_init_1273.2.bts:/system/etc/fmc_init_1273.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/fmc_init_6450.2.bts:/system/etc/fmc_init_6450.2.bts \\
    vendor/motorola/__DEVICE__/proprietary/pppd-ril.options:/system/etc/ppp/peers/pppd-ril.options \\
    vendor/motorola/__DEVICE__/proprietary/priority_notifications_config.xml:/system/etc/priority_notifications_config.xml \\
    vendor/motorola/__DEVICE__/proprietary/pvextensions.cfg:/system/etc/pvextensions.cfg \\
    vendor/motorola/__DEVICE__/proprietary/pvplayer_mot.cfg:/system/etc/pvplayer_mot.cfg \\
    vendor/motorola/__DEVICE__/proprietary/mancacerts.zip:/system/etc/security/mancacerts.zip \\
    vendor/motorola/__DEVICE__/proprietary/oprcacerts.zip:/system/etc/security/oprcacerts.zip \\
    vendor/motorola/__DEVICE__/proprietary/suplcerts.bks:/system/etc/security/suplcerts.bks \\
    vendor/motorola/__DEVICE__/proprietary/smc_android_cfg.ini:/system/etc/smc_android_cfg.ini \\
    vendor/motorola/__DEVICE__/proprietary/smc_android_cfg_256.ini:/system/etc/smc_android_cfg_256.ini \\
    vendor/motorola/__DEVICE__/proprietary/smc_pa.ift:/system/etc/smc_pa.ift \\
    vendor/motorola/__DEVICE__/proprietary/smc_pa_pk_4_ipa.bin:/system/etc/smc_pa_pk_4_ipa.bin \\
    vendor/motorola/__DEVICE__/proprietary/supportedlocales.conf:/system/etc/supportedlocales.conf \\
    vendor/motorola/__DEVICE__/proprietary/vzwpubagps.cer:/system/etc/vzwpubagps.cer \\
    vendor/motorola/__DEVICE__/proprietary/fw_tiwlan_ap.bin:/system/etc/wifi/fw_tiwlan_ap.bin \\
    vendor/motorola/__DEVICE__/proprietary/fw_wlan1271.bin:/system/etc/wifi/fw_wlan1271.bin \\
    vendor/motorola/__DEVICE__/proprietary/hostapd.conf.templet:/system/etc/wifi/hostapd.conf.templet \\
    vendor/motorola/__DEVICE__/proprietary/tiwlan.ini:/system/etc/wifi/tiwlan.ini \\
    vendor/motorola/__DEVICE__/proprietary/tiwlan_ap.ini:/system/etc/wifi/tiwlan_ap.ini \\
    vendor/motorola/__DEVICE__/proprietary/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \\
    vendor/motorola/__DEVICE__/proprietary/720p_h264vdec_sn.dll64P:/system/lib/dsp/720p_h264vdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/720p_mp4vdec_sn.dll64P:/system/lib/dsp/720p_mp4vdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/720p_mp4venc_sn.dll64P:/system/lib/dsp/720p_mp4venc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/baseimage.dof:/system/lib/dsp/baseimage.dof \\
    vendor/motorola/__DEVICE__/proprietary/conversions.dll64P:/system/lib/dsp/conversions.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/h264vdec_sn.dll64P:/system/lib/dsp/h264vdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/h264venc_sn.dll64P:/system/lib/dsp/h264venc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/jpegenc_sn.dll64P:/system/lib/dsp/jpegenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/m4venc_sn.dll64P:/system/lib/dsp/m4venc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/mp3dec_sn.dll64P:/system/lib/dsp/mp3dec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/mp4vdec_sn.dll64P:/system/lib/dsp/mp4vdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/mpeg4aacdec_sn.dll64P:/system/lib/dsp/mpeg4aacdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/mpeg4aacenc_sn.dll64P:/system/lib/dsp/mpeg4aacenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/nbamrdec_sn.dll64P:/system/lib/dsp/nbamrdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/nbamrenc_sn.dll64P:/system/lib/dsp/nbamrenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/postprocessor_dualout.dll64P:/system/lib/dsp/postprocessor_dualout.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/ringio.dll64P:/system/lib/dsp/ringio.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/usn.dll64P:/system/lib/dsp/usn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/wbamrdec_sn.dll64P:/system/lib/dsp/wbamrdec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/wbamrenc_sn.dll64P:/system/lib/dsp/wbamrenc_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/wmadec_sn.dll64P:/system/lib/dsp/wmadec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/wmv9dec_sn.dll64P:/system/lib/dsp/wmv9dec_sn.dll64P \\
    vendor/motorola/__DEVICE__/proprietary/libEGL_POWERVR_SGX530_125.so:/system/lib/egl/libEGL_POWERVR_SGX530_125.so \\
    vendor/motorola/__DEVICE__/proprietary/libGLESv1_CM_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \\
    vendor/motorola/__DEVICE__/proprietary/libGLESv2_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \\
    vendor/motorola/__DEVICE__/proprietary/libeglinfo.so:/system/lib/egl/libeglinfo.so \\
    vendor/motorola/__DEVICE__/proprietary/libgles1_texture_stream.so:/system/lib/egl/libgles1_texture_stream.so \\
    vendor/motorola/__DEVICE__/proprietary/libgles2_texture_stream.so:/system/lib/egl/libgles2_texture_stream.so \\
    vendor/motorola/__DEVICE__/proprietary/gestures.shadow.so:/system/lib/hw/gestures.shadow.so \\
    vendor/motorola/__DEVICE__/proprietary/gralloc.omap3.so:/system/lib/hw/gralloc.omap3.so \\
    vendor/motorola/__DEVICE__/proprietary/libFMRadio.so:/system/lib/libFMRadio.so \\
    vendor/motorola/__DEVICE__/proprietary/libHPImgApi.so:/system/lib/libHPImgApi.so \\
    vendor/motorola/__DEVICE__/proprietary/libIMGegl.so:/system/lib/libIMGegl.so \\
    vendor/motorola/__DEVICE__/proprietary/libMynetNativeJni.so:/system/lib/libMynetNativeJni.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.720P.Decoder.so:/system/lib/libOMX.TI.720P.Decoder.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.720P.Encoder.so:/system/lib/libOMX.TI.720P.Encoder.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.AAC.decode.so:/system/lib/libOMX.TI.AAC.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.AMR.decode.so:/system/lib/libOMX.TI.AMR.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.MP3.decode.so:/system/lib/libOMX.TI.MP3.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.WBAMR.decode.so:/system/lib/libOMX.TI.WBAMR.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.WMA.decode.so:/system/lib/libOMX.TI.WMA.decode.so \\
    vendor/motorola/__DEVICE__/proprietary/libOMX.TI.mp4.splt.Encoder.so:/system/lib/libOMX.TI.mp4.splt.Encoder.so \\
    vendor/motorola/__DEVICE__/proprietary/libSwypeCore.so:/system/lib/libSwypeCore.so \\
    vendor/motorola/__DEVICE__/proprietary/libWifiAPHardware.so:/system/lib/libWifiAPHardware.so \\
    vendor/motorola/__DEVICE__/proprietary/libWifiAPNativeJni.so:/system/lib/libWifiAPNativeJni.so \\
    vendor/motorola/__DEVICE__/proprietary/libarcsoftpe.so:/system/lib/libarcsoftpe.so \\
    vendor/motorola/__DEVICE__/proprietary/libbattd.so:/system/lib/libbattd.so \\
    vendor/motorola/__DEVICE__/proprietary/libcaps.so:/system/lib/libcaps.so \\
    vendor/motorola/__DEVICE__/proprietary/libcryptoki.so:/system/lib/libcryptoki.so \\
    vendor/motorola/__DEVICE__/proprietary/libdlnahttpjni.so:/system/lib/libdlnahttpjni.so \\
    vendor/motorola/__DEVICE__/proprietary/libdlnajni.so:/system/lib/libdlnajni.so \\
    vendor/motorola/__DEVICE__/proprietary/libdlnaprofileparser.so:/system/lib/libdlnaprofileparser.so \\
    vendor/motorola/__DEVICE__/proprietary/libdlnasysjni.so:/system/lib/libdlnasysjni.so \\
    vendor/motorola/__DEVICE__/proprietary/libdmengine.so:/system/lib/libdmengine.so \\
    vendor/motorola/__DEVICE__/proprietary/libdmjavaplugin.so:/system/lib/libdmjavaplugin.so \\
    vendor/motorola/__DEVICE__/proprietary/libextdisp.so:/system/lib/libextdisp.so \\
    vendor/motorola/__DEVICE__/proprietary/libfmradio_jni.so:/system/lib/libfmradio_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libfmradioplayer.so:/system/lib/libfmradioplayer.so \\
    vendor/motorola/__DEVICE__/proprietary/libglslcompiler.so:/system/lib/libglslcompiler.so \\
    vendor/motorola/__DEVICE__/proprietary/libhdmi.so:/system/lib/libhdmi.so \\
    vendor/motorola/__DEVICE__/proprietary/libhostapd_client.so:/system/lib/libhostapd_client.so \\
    vendor/motorola/__DEVICE__/proprietary/libimage_jni.so:/system/lib/libimage_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libjanus.so:/system/lib/libjanus.so \\
    vendor/motorola/__DEVICE__/proprietary/libjanus_jni.so:/system/lib/libjanus_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libkpt-review.so:/system/lib/libkpt-review.so \\
    vendor/motorola/__DEVICE__/proprietary/libmediaext.so:/system/lib/libmediaext.so \\
    vendor/motorola/__DEVICE__/proprietary/libmetainfo.so:/system/lib/libmetainfo.so \\
    vendor/motorola/__DEVICE__/proprietary/libmot_atcmd.so:/system/lib/libmot_atcmd.so \\
    vendor/motorola/__DEVICE__/proprietary/libmot_atcmd_mflex.so:/system/lib/libmot_atcmd_mflex.so \\
    vendor/motorola/__DEVICE__/proprietary/libmot_bluetooth_jni.so:/system/lib/libmot_bluetooth_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libmot_btpan_jni.so:/system/lib/libmot_btpan_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libmot_led.so:/system/lib/libmot_led.so \\
    vendor/motorola/__DEVICE__/proprietary/libmotdrm1.so:/system/lib/libmotdrm1.so \\
    vendor/motorola/__DEVICE__/proprietary/libmotdrm1_jni.so:/system/lib/libmotdrm1_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libmoto_netutil.so:/system/lib/libmoto_netutil.so \\
    vendor/motorola/__DEVICE__/proprietary/libmoto_ril.so:/system/lib/libmoto_ril.so \\
    vendor/motorola/__DEVICE__/proprietary/libmotodbgutils.so:/system/lib/libmotodbgutils.so \\
    vendor/motorola/__DEVICE__/proprietary/libmotoims-sms.so:/system/lib/libmotoims-sms.so \\
    vendor/motorola/__DEVICE__/proprietary/libmotprojectM.so:/system/lib/libmotprojectM.so \\
    vendor/motorola/__DEVICE__/proprietary/libmtp_jni.so:/system/lib/libmtp_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libmtpstack.so:/system/lib/libmtpstack.so \\
    vendor/motorola/__DEVICE__/proprietary/libnativedrm1.so:/system/lib/libnativedrm1.so \\
    vendor/motorola/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/motorola/__DEVICE__/proprietary/libomx_arcomxcore_sharedlibrary.so:/system/lib/libomx_arcomxcore_sharedlibrary.so \\
    vendor/motorola/__DEVICE__/proprietary/libomx_evrcdec_sharedlibrary.so:/system/lib/libomx_evrcdec_sharedlibrary.so \\
    vendor/motorola/__DEVICE__/proprietary/libomx_qcelpdec_sharedlibrary.so:/system/lib/libomx_qcelpdec_sharedlibrary.so \\
    vendor/motorola/__DEVICE__/proprietary/libomx_qcelpenc_sharedlibrary.so:/system/lib/libomx_qcelpenc_sharedlibrary.so \\
    vendor/motorola/__DEVICE__/proprietary/libomx_wmadec_sharedlibrary.so:/system/lib/libomx_wmadec_sharedlibrary.so \\
    vendor/motorola/__DEVICE__/proprietary/libopencore_arcaudiolocal.so:/system/lib/libopencore_arcaudiolocal.so \\
    vendor/motorola/__DEVICE__/proprietary/libopencore_arcaudiolocalreg.so:/system/lib/libopencore_arcaudiolocalreg.so \\
    vendor/motorola/__DEVICE__/proprietary/libopencore_motlocal.so:/system/lib/libopencore_motlocal.so \\
    vendor/motorola/__DEVICE__/proprietary/libopencore_motlocalreg.so:/system/lib/libopencore_motlocalreg.so \\
    vendor/motorola/__DEVICE__/proprietary/libopencore_motojanusreg.so:/system/lib/libopencore_motojanusreg.so \\
    vendor/motorola/__DEVICE__/proprietary/libopencore_motoma1.so:/system/lib/libopencore_motoma1.so \\
    vendor/motorola/__DEVICE__/proprietary/libpanorama.so:/system/lib/libpanorama.so \\
    vendor/motorola/__DEVICE__/proprietary/libpanorama_jni.so:/system/lib/libpanorama_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libpkip.so:/system/lib/libpkip.so \\
    vendor/motorola/__DEVICE__/proprietary/libpppd_plugin-ril.so:/system/lib/libpppd_plugin-ril.so \\
    vendor/motorola/__DEVICE__/proprietary/libpppd_plugin.so:/system/lib/libpppd_plugin.so \\
    vendor/motorola/__DEVICE__/proprietary/libprojectM.so:/system/lib/libprojectM.so \\
    vendor/motorola/__DEVICE__/proprietary/libprovlib.so:/system/lib/libprovlib.so \\
    vendor/motorola/__DEVICE__/proprietary/libpvgetmetadata_extn.so:/system/lib/libpvgetmetadata_extn.so \\
    vendor/motorola/__DEVICE__/proprietary/libpvr2d.so:/system/lib/libpvr2d.so \\
    vendor/motorola/__DEVICE__/proprietary/libpvrANDROID_WSEGL.so:/system/lib/libpvrANDROID_WSEGL.so \\
    vendor/motorola/__DEVICE__/proprietary/libscalado.so:/system/lib/libscalado.so \\
    vendor/motorola/__DEVICE__/proprietary/libsmapi.so:/system/lib/libsmapi.so \\
    vendor/motorola/__DEVICE__/proprietary/libsrv_init.so:/system/lib/libsrv_init.so \\
    vendor/motorola/__DEVICE__/proprietary/libsrv_um.so:/system/lib/libsrv_um.so \\
    vendor/motorola/__DEVICE__/proprietary/libssmgr.so:/system/lib/libssmgr.so \\
    vendor/motorola/__DEVICE__/proprietary/libtpa.so:/system/lib/libtpa.so \\
    vendor/motorola/__DEVICE__/proprietary/libtpa_core.so:/system/lib/libtpa_core.so \\
    vendor/motorola/__DEVICE__/proprietary/libui3d.so:/system/lib/libui3d.so \\
    vendor/motorola/__DEVICE__/proprietary/libvideoeditorlite.so:/system/lib/libvideoeditorlite.so \\
    vendor/motorola/__DEVICE__/proprietary/libvisualization_jni.so:/system/lib/libvisualization_jni.so \\
    vendor/motorola/__DEVICE__/proprietary/libvsuite_sharedlib.so:/system/lib/libvsuite_sharedlib.so \\
    vendor/motorola/__DEVICE__/proprietary/libwbxmlparser.so:/system/lib/libwbxmlparser.so \\
    vendor/motorola/__DEVICE__/proprietary/ulogd_BASE.so:/system/lib/ulogd_BASE.so \\
    vendor/motorola/__DEVICE__/proprietary/ulogd_SQLITE3.so:/system/lib/ulogd_SQLITE3.so \\
    vendor/motorola/__DEVICE__/proprietary/en-US_lh0_sg.bin:/system/tts/lang_pico/en-US_lh0_sg.bin \\
    vendor/motorola/__DEVICE__/proprietary/en-US_ta.bin:/system/tts/lang_pico/en-US_ta.bin \\
    vendor/motorola/__DEVICE__/proprietary/es-ES_ta.bin:/system/tts/lang_pico/es-ES_ta.bin \\
    vendor/motorola/__DEVICE__/proprietary/es-ES_zl0_sg.bin:/system/tts/lang_pico/es-ES_zl0_sg.bin \\
    vendor/motorola/__DEVICE__/proprietary/cdma_shadow-keypad.kcm.bin:/system/usr/keychars/cdma_shadow-keypad.kcm.bin \\
    vendor/motorola/__DEVICE__/proprietary/cdma_shadow-keypad.kl:/system/usr/keylayout/cdma_shadow-keypad.kl \\
    vendor/motorola/__DEVICE__/proprietary/cpcap-key.kl:/system/usr/keylayout/cpcap-key.kl \\
    vendor/motorola/__DEVICE__/proprietary/backup:/system/xbin/backup \\
    vendor/motorola/__DEVICE__/proprietary/drm1_func_test:/system/xbin/drm1_func_test \\
    vendor/motorola/__DEVICE__/proprietary/pppd:/system/xbin/pppd \\
    vendor/motorola/__DEVICE__/proprietary/run_backup:/system/xbin/run_backup \\
    vendor/motorola/__DEVICE__/proprietary/run_restore:/system/xbin/run_restore \\
    vendor/motorola/__DEVICE__/proprietary/ssmgrd:/system/xbin/ssmgrd \\
    vendor/motorola/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so \\
    vendor/motorola/__DEVICE__/proprietary/libnmea.so:/system/lib/libnmea.so \\
    vendor/motorola/__DEVICE__/proprietary/libril_rds.so:/system/lib/libril_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/libgps_rds.so:/system/lib/libgps_rds.so \\
    vendor/motorola/__DEVICE__/proprietary/libsmiledetect.so:/system/lib/libsmiledetect.so \\
    vendor/motorola/__DEVICE__/proprietary/libarcsoft.so:/system/lib/libarcsoft.so

EOF

./setup-makefiles.sh
