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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-check_kernel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := check_kernel
LOCAL_SRC_FILES := check_kernel
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-finalize_release
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := finalize_release
LOCAL_SRC_FILES := finalize_release
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-gb_kern-update-binary
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := gb_kern-update-binary
LOCAL_SRC_FILES := gb_kern-update-binary
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-gb_kern-update.zip
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := gb_kern-update.zip
LOCAL_SRC_FILES := gb_kern-update.zip
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-mke2fs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := mke2fs
LOCAL_SRC_FILES := mke2fs
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-tune2fs
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := tune2fs
LOCAL_SRC_FILES := tune2fs
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := shadow_releaseutils-update_kernel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/releaseutils
LOCAL_MODULE_STEM := update_kernel
LOCAL_SRC_FILES := update_kernel
include $(BUILD_PREBUILT)
