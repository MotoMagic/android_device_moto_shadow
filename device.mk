################# DEVICE SPECIFIC STUFF #####################
#
# Below are some things that make sure that the rom runs
# properly on shadow (droid x) hardware
#

# gps info
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# device overlay
DEVICE_PACKAGE_OVERLAYS := device/motorola/shadow/overlay

# properties for shadow
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
#	debug.mot.extwmlog=1 \
#	debug.mot.extamlog=1 \

# it's a hdpi device
PRODUCT_LOCALES += hdpi

# enough space for precise gc info
PRODUCT_TAGS += dalvik.gc.type-precise

# copy some permissions files
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# include proprietaries
ifneq ($(USE_PROPRIETARIES),)
# if we aren't including google, we need to include some basic files
ifeq ($(filter google,$(USE_PROPRIETARIES)),)
PRODUCT_PACKAGES += \
	Provision \
	QuickSearchBox
endif

# actually include the props
$(foreach prop,$(USE_PROPRIETARIES), \
  $(if $(wildcard device/motorola/shadow/proprietary.$(prop)), \
    $(eval \
PRODUCT_COPY_FILES += $(shell \
	cat device/motorola/shadow/proprietary.$(prop) \
	| sed -r 's/^\/(.*\/)([^/ ]+)$$/device\/motorola\/shadow\/proprietary\/\2:\1\2/' \
	| tr '\n' ' ') \
     ), \
    $(error Cannot include proprietaries from $(prop). List file device/motorola/shadow/proprietary.$(prop) does not exist) \
   ) \
 )
endif

