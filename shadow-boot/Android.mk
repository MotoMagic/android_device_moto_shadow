# Copyright (C) 2008 The Android Open Source Project
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

# since we're creating our own boot package, make sure we're on shadow
ifeq ($(TARGET_DEVICE),shadow)

LOCAL_PATH:= $(call my-dir)

# output for shadow_boot
SHADOW_BOOT_OUT := $(PRODUCT_OUT)/shadow-boot
SHADOW_BOOT_OUT_UNSTRIPPED := $(TARGET_OUT_UNSTRIPPED)/shadow-boot

# prerequisites for building shadow-boot.zip
# we will need the bootimage made to ensure our root directory is finalized
SHADOW_BOOT_PREREQS := $(INSTALLED_BOOTIMAGE_TARGET)

# copy the hijack file
file := $(SHADOW_BOOT_OUT)/sbin/hijack
$(file) : $(call intermediates-dir-for,EXECUTABLES,hijack)/hijack
	@echo "Copy hijack -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a $(call intermediates-dir-for,EXECUTABLES,hijack)/hijack $@
SHADOW_BOOT_PREREQS += $(file)

# copy hijack log dump if we must (we use a custom one for the chroot environment)
ifeq ($(BOARD_HIJACK_LOG_ENABLE),true)
file := $(SHADOW_BOOT_OUT)/sbin/hijack.log_dump
$(file) : device/motorola/shadow/shadow-boot/hijack.log_dump
	@echo "Copy hijack.log_dump -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/shadow/shadow-boot/hijack.log_dump $@
SHADOW_BOOT_PREREQS += $(file)
endif

# copy hijack kill script
file := $(SHADOW_BOOT_OUT)/sbin/hijack.killall
$(file) : device/motorola/shadow/shadow-boot/hijack.killall
	@echo "Copy hijack.killall -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/shadow/shadow-boot/hijack.killall $@
SHADOW_BOOT_PREREQS += $(file)

# copy hijack indefinite logging script
file := $(SHADOW_BOOT_OUT)/sbin/hijack.log_dump.indefinite
$(file) : device/motorola/shadow/shadow-boot/hijack.log_dump.indefinite
	@echo "Copy hijack.log_dump.indefinite -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/shadow/shadow-boot/hijack.log_dump.indefinite $@
SHADOW_BOOT_PREREQS += $(file)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := getprop.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := shadow_boot_getprop
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libcutils libc
LOCAL_MODULE_CLASS := SHADOW_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(SHADOW_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(SHADOW_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := getprop
SHADOW_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := 2nd-init.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := shadow_boot_2nd-init
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libcutils libc
LOCAL_MODULE_CLASS := SHADOW_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(SHADOW_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(SHADOW_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := 2nd-init
SHADOW_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := stop.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := shadow_boot_stop
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libcutils libc
LOCAL_MODULE_CLASS := SHADOW_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(SHADOW_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(SHADOW_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := stop
SHADOW_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	logcat.cpp \
	event.logtags
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := shadow_boot_logcat
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += liblog libstdc++ libcutils libc
LOCAL_MODULE_CLASS := SHADOW_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(SHADOW_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(SHADOW_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := logcat
SHADOW_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

# now we make the shadow-boot target files package
name := $(TARGET_PRODUCT)-shadow_boot_files
intermediates := $(call intermediates-dir-for,PACKAGING,shadow_boot_files)
BUILT_SHADOW_BOOT_FILES_PACKAGE := $(intermediates)/$(name).zip
$(BUILT_SHADOW_BOOT_FILES_PACKAGE) : intermediates := $(intermediates)
$(BUILT_SHADOW_BOOT_FILES_PACKAGE) : \
		zip_root := $(intermediates)/$(name)

built_ota_tools := \
        $(call intermediates-dir-for,EXECUTABLES,applypatch)/applypatch \
        $(call intermediates-dir-for,EXECUTABLES,applypatch_static)/applypatch_static \
        $(call intermediates-dir-for,EXECUTABLES,check_prereq)/check_prereq \
        $(call intermediates-dir-for,EXECUTABLES,updater)/updater

$(BUILT_SHADOW_BOOT_FILES_PACKAGE) : PRIVATE_OTA_TOOLS := $(built_ota_tools)
$(BUILT_SHADOW_BOOT_FILES_PACKAGE) : PRIVATE_RECOVERY_API_VERSION := $(RECOVERY_API_VERSION)
$(BUILT_SHADOW_BOOT_FILES_PACKAGE) : \
		$(SHADOW_BOOT_PREREQS) \
		$(INSTALLED_ANDROID_INFO_TXT_TARGET) \
		$(built_ota_tools) \
		$(HOST_OUT_EXECUTABLES)/fs_config \
		| $(ACP)
	@echo "Package shadow-boot files: $@"
	$(hide) rm -rf $@ $(zip_root)
	$(hide) mkdir -p $(dir $@) $(zip_root)
	@# Components of the boot section
	$(hide) mkdir -p $(zip_root)/NEWBOOT
	$(hide) $(call package_files-copy-root, \
		$(TARGET_ROOT_OUT),$(zip_root)/NEWBOOT)
	$(hide) $(call package_files-copy-root, \
		$(SHADOW_BOOT_OUT),$(zip_root)/NEWBOOT)
	@# Contents of the OTA package
	$(hide) mkdir -p $(zip_root)/OTA/bin
	$(hide) $(ACP) $(INSTALLED_ANDROID_INFO_TXT_TARGET) $(zip_root)/OTA/
	$(hide) $(ACP) $(PRIVATE_OTA_TOOLS) $(zip_root)/OTA/bin/
	@# Files required to build an update.zip
	$(hide) mkdir -p $(zip_root)/META
	$(hide) echo "recovery_api_version=$(PRIVATE_RECOVERY_API_VERSION)" > $(zip_root)/META/misc_info.txt
	@# Zip everything up, preserving symlinks
	$(hide) (cd $(zip_root) && zip -qry ../$(notdir $@) .)
	@# Run fs_config on all the boot files in the zip and save the output
	$(hide) echo "newboot 0 0 755" > $(zip_root)/META/filesystem_config.txt
	$(hide) zipinfo -1 $@ \
		| awk -F/ 'BEGIN { OFS="/" } /^NEWBOOT\/./' \
		| sed -r 's/^NEWBOOT\///' \
		| $(HOST_OUT_EXECUTABLES)/fs_config \
		| sed -r 's/^/newboot\//' >> $(zip_root)/META/filesystem_config.txt
	$(hide) (cd $(zip_root) && zip -q ../$(notdir $@) META/filesystem_config.txt)

# next it's the OTA target
SHADOW_BOOT_OTA_PACKAGE_TARGET := $(PRODUCT_OUT)/shadow-boot.zip
$(SHADOW_BOOT_OTA_PACKAGE_TARGET) : $(BUILT_SHADOW_BOOT_FILES_PACKAGE) $(OTATOOLS)
	@echo "Package shadow-boot OTA: $@"
	$(hide) ./device/motorola/shadow/releasetools/shadow_boot_ota_from_target_files -v \
	   -p $(HOST_OUT) \
	   -k $(KEY_CERT_PAIR) \
	   --backup=$(false) \
	   --override_device=auto \
	   $(BUILT_SHADOW_BOOT_FILES_PACKAGE) $@

# then copy the OTA to /system/etc
SHADOW_BOOT := $(TARGET_OUT_ETC)/shadow-boot.zip
$(SHADOW_BOOT) : $(SHADOW_BOOT_OTA_PACKAGE_TARGET) | $(ACP)
	@echo "Copy shadow-boot OTA -> $@"
	$(hide) $(ACP) $(SHADOW_BOOT_OTA_PACKAGE_TARGET) $(SHADOW_BOOT)

# finally add the ota in /system/etc to ALL_PREBUILT so that all of this will get pulled
# in as dependencies and built
ALL_PREBUILT += $(SHADOW_BOOT)

endif
