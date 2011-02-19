#
# Copyright (C) 2009 The Android Open Source Project
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
#

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/motorola/shadow/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/motorola/shadow/init.mapphone_umts.rc:root/init.mapphone_umts.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/shadow/shadow-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.ril=yes \
    persist.ril.mux.noofchannels=7 \
    persist.ril.mux.ttydevice=/dev/ttyS0 \
    persist.ril.modem.ttydevice=/dev/ttyUSB0 \
    persist.ril.features=0x07 \
    persist.ril.mux.retries=500 \
    persist.ril.mux.sleep=2 \
    ro.default_usb_mode=0 \
    ro.product.multi_touch_enabled=true \
    ro.product.max_num_touch=2 \
    ro.telephony.sms_segment_size=160 \
    ro.setupwizard.mode=OPTIONAL \
    ro.com.google.gmsversion=2.2_r7 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=1000 \
    ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=A855 \
    ro.setupwizard.enable_bypass=1 \
    ro.com.google.clientid=android-motorola \
    ro.com.google.clientidbase=android-verizon \
    ro.com.google.clientidbase.am=android-verizon \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.config.vc_call_vol_steps=7 \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
    ro.com.motorola.smartsensor=true \
    ro.media.capture.maxres=8m \
    ro.media.capture.fast.fps=4 \
    ro.media.capture.slow.fps=60 \
    ro.media.capture.flash=led \
    ro.media.capture.classification=classD \
    ro.media.capture.useDFR=1 \
    ro.media.camera.focal=3564.0,3564.0 \
    ro.media.camera.principal=1632.0,1224.0 \
    ro.media.camera.skew=0.0 \
    ro.media.camera.distortion=0.0,0.0,0.0,0.0,0.0 \
    ro.media.camera.calresolution=3264,2448 \
    ro.mot.hw.uaprof=http://uaprof.motorola.com/phoneconfig/MotoMB200/profile/MotoMB200.rdf \
    ro.build.version.full=Blur_Version.2.3.340.MB810.Verizon.en.US \
    ro.build.config.version=GAS_NA_GCXSHAD00VZW_P022 \
    ro.build.config.date=Sun_Nov_07_23:40:30_-0600_2010
#############################################################
#    debug.mot.extwmlog=1 \
#    debug.mot.extamlog=1 \

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/shadow/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    tiwlan.ini \
    dspexec \
    libbridge \
    overlay.omap3 \
    wlan_cu \
    libtiOsLib \
    wlan_loader \
    libCustomWifi \
    wpa_supplicant.conf \
    dhcpcd.conf \
    libOMX.TI.AAC.encode \
    libOMX.TI.AMR.encode \
    libOMX.TI.WBAMR.encode \
    libOMX.TI.JPEG.Encoder \
    libLCML \
    libOMX_Core \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libVendor_ti_omx \
    gps.shadow \
    sensors.shadow \
    lights.shadow

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/motorola/shadow/DroidXBootstrap.cfg:system/etc/DroidXBootstrap.cfg \
    device/motorola/shadow/vold.fstab:system/etc/vold.fstab \
    device/motorola/shadow/apns-conf.xml:system/etc/apns-conf.xml \
    device/motorola/shadow/mount_ext3.sh:system/bin/mount_ext3.sh

PRODUCT_COPY_FILES += \
    device/motorola/shadow/kernel/act_gact.ko:system/lib/modules/act_gact.ko \
    device/motorola/shadow/kernel/act_mirred.ko:system/lib/modules/act_mirred.ko \
    device/motorola/shadow/kernel/act_police.ko:system/lib/modules/act_police.ko \
    device/motorola/shadow/kernel/cls_u32.ko:system/lib/modules/cls_u32.ko \
    device/motorola/shadow/kernel/dummy.ko:system/lib/modules/dummy.ko \
    device/motorola/shadow/kernel/em_u32.ko:system/lib/modules/em_u32.ko \
    device/motorola/shadow/kernel/ifb.ko:system/lib/modules/ifb.ko \
    device/motorola/shadow/kernel/modem_pm_driver.ko:system/lib/modules/modem_pm_driver.ko \
    device/motorola/shadow/kernel/netmux.ko:system/lib/modules/netmux.ko \
    device/motorola/shadow/kernel/netmux_linkdriver.ko:system/lib/modules/netmux_linkdriver.ko \
    device/motorola/shadow/kernel/output.ko:system/lib/modules/output.ko \
    device/motorola/shadow/kernel/pcbc.ko:system/lib/modules/pcbc.ko \
    device/motorola/shadow/kernel/sch_htb.ko:system/lib/modules/sch_htb.ko \
    device/motorola/shadow/kernel/sch_ingress.ko:system/lib/modules/sch_ingress.ko \
    device/motorola/shadow/kernel/sec.ko:system/lib/modules/sec.ko \
    device/motorola/shadow/kernel/tiap_drv.ko:system/lib/modules/tiap_drv.ko \
    device/motorola/shadow/kernel/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko \
    device/motorola/shadow/kernel/wl127x_test.ko:system/lib/modules/wl127x_test.ko

# these need to be here for the installer, just put them here for now
PRODUCT_COPY_FILES += \
    device/motorola/shadow/utilities/mke2fs:system/bin/mke2fs \
    device/motorola/shadow/utilities/tune2fs:system/bin/tune2fs

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/shadow/kernel/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/motorola/shadow/shadow-vendor.mk)

# media profiles and capabilities spec
# $(call inherit-product, device/motorola/shadow/media_a1026.mk)

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := generic_shadow
PRODUCT_DEVICE := shadow
