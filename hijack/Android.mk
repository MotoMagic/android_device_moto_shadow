LOCAL_PATH := $(call my-dir)

# we compile hijack if we have hijacked executables
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),shadow)
ifeq ($(BOARD_HIJACK_ENABLE),true)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := hijack.c
LOCAL_MODULE := hijack
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := \
	libbusybox \
	libclearsilverregex \
	libm \
	libcutils \
	libc
LOCAL_CFLAGS += \
	-DUPDATE_BINARY=\"/preinstall/recovery/update-binary\" \
	-DBOOT_UPDATE_ZIP=\"/system/etc/shadow-boot.zip\" \
	-DRECOVERY_UPDATE_ZIP=\"/preinstall/recovery/recovery.zip\"
LOCAL_FORCE_STATIC_EXECUTABLE := true

ifeq ($(BOARD_HIJACK_LOG_ENABLE),true)
LOCAL_CFLAGS += -DLOG_ENABLE
endif

include $(BUILD_EXECUTABLE)

# this is kind of ugly, but whatever...
ALL_PREBUILT += $(TARGET_OUT)/bin/logwrapper
$(TARGET_OUT)/bin/logwrapper : $(TARGET_OUT)/bin/hijack
	@echo "Symlink: logwrapper -> hijack"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf hijack $@

ifeq ($(BOARD_HIJACK_LOG_ENABLE),true)
include $(CLEAR_VARS)
LOCAL_MODULE := hijack.log_dump
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
endif

include $(CLEAR_VARS)
LOCAL_MODULE := reboot_alt
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

endif # BOARD_HIJACK_ENABLE=true
endif # TARGET_BOOTLAODER_BOARD_NAME=shadow
