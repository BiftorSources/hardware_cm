# Copyright (C) 2012 The Android Open Source Project
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

ifeq ($(TARGET_USES_CM_POWERHAL),true)
ifneq ($(WITH_QC_PERF),true)

LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

ifeq ($(TARGET_POWERHAL_NO_TOUCH_BOOST),true)
LOCAL_CFLAGS += -DNO_TOUCH_BOOST
endif

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_SRC_FILES := power.c

ifeq ($(CM_POWERHAL_EXTENSION),)
LOCAL_MODULE := power.$(TARGET_BOARD_PLATFORM)
else
LOCAL_MODULE := power.$(CM_POWERHAL_EXTENSION)
endif

LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif # !WITH_QC_PERF
endif # TARGET_USES_CM_POWERHAL
