LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel/zImage

# modules to include for default kernel
PRODUCT_COPY_FILES += $(shell \
        find $(LOCAL_PATH)/kernel -name '*.ko' \
        | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
        | tr '\n' ' ')
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.mapphone_umts.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.mapphone_umts.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.mapphone_cdma.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.mapphone_cdma.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init_prep_keypad.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init_prep_keypad.sh | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/logging.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/logging.sh | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_MODULE := libaudio.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libaudiopolicy.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libcamera.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libril_rds.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libnmea.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libgps_rds.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

# dependency for libcamera.so
include $(CLEAR_VARS)
LOCAL_MODULE := libsmiledetect.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

# dependency for libsmiledetect.so
include $(CLEAR_VARS)
LOCAL_MODULE := libarcsoft.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $(BUILD_PREBUILT)

# symlink some keymap stuff
file := $(TARGET_OUT)/usr/keychars/sholes-keypad.kcm.bin
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/usr/keychars/cdma_shadow-keypad.kcm.bin
	@echo "Symlink: $@ -> cdma_shadow-keypad.kcm.bin"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf cdma_shadow-keypad.kcm.bin $@
file := $(TARGET_OUT)/usr/keylayout/sholes-keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/usr/keylayout/cdma_shadow-keypad.kl
	@echo "Symlink: $@ -> cdma_shadow-keypad.kl"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf cdma_shadow-keypad.kl $@

# symlink some motobox stuff
file := $(TARGET_OUT)/system/bin/[
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/[
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
file := $(TARGET_OUT)/system/bin/cp
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/cp
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
file := $(TARGET_OUT)/system/bin/format
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/format
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
file := $(TARGET_OUT)/system/bin/masterclear
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/masterclear
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
file := $(TARGET_OUT)/system/bin/md5sum
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/md5sum
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
file := $(TARGET_OUT)/system/bin/ptf
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/ptf
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
file := $(TARGET_OUT)/system/bin/test
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/system/bin/test
	@echo "Symlink: $@ -> motobox"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf motobox $@
