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
#PRODUCT_PROPERTY_OVERRIDES += \

# it's a hdpi device
PRODUCT_LOCALES += hdpi

# enough space for precise gc info
PRODUCT_TAGS += dalvik.gc.type-precise

# copy some permissions files
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# include proprietaries
ifneq ($(USE_PROPRIETARIES),)
# if we aren't including google, we need to include some basic files
ifeq ($(filter google,$(USE_PROPRIETARIES)),)
PRODUCT_PACKAGES += \
	Provision \
	LatinIME \
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

