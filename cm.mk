## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := DROIDX

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/shadow/full_shadow.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := shadow
PRODUCT_NAME := cm_shadow
PRODUCT_BRAND := motorola
PRODUCT_MODEL := DROIDX
PRODUCT_MANUFACTURER := Motorola

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=VZW PRODUCT_NAME=shadow_vzw TARGET_DEVICE=cdma_shadow BUILD_FINGERPRINT=verizon/shadow_vzw/cdma_shadow/shadow:2.2.1/VZW/23.340:user/ota-rel-keys,release-keys PRODUCT_BRAND=verizon PRIVATE_BUILD_DESC="cdma_shadow-user 2.2.1 VZW 2.3.340 ota-rel-keys,release-keys" BUILD_NUMBER=2.3.340 BUILD_UTC_DATE=1289194863 TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys USER=w30471
