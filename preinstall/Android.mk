LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),shadow)

# update.zip!
file := $(TARGET_PREINSTALL_OUT)/obsidian/update-boot.zip
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/update-boot.zip | $(ACP)
	$(transform-prebuilt-to-target)
file := $(TARGET_PREINSTALL_OUT)/obsidian/update-recovery.zip
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/update-recovery.zip | $(ACP)
	$(transform-prebuilt-to-target)

# update-binary!
file := $(TARGET_PREINSTALL_OUT)/obsidian/update-binary
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/bin/updater | $(ACP)
        $(transform-prebuilt-to-target)

endif
