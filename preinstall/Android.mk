LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),shadow)

# update.zip!
file := $(TARGET_PREINSTALL_OUT)/recovery/update.zip
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/update.zip | $(ACP)
	$(transform-prebuilt-to-target)

# update-binary!
file := $(TARGET_PREINSTALL_OUT)/recovery/update-binary
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/update-binary | $(ACP)
	$(transform-prebuilt-to-target)

endif
