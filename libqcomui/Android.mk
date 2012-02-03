LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        qcom_ui.cpp

ifeq ($(call is-board-platform,msm7627a),true)
      LOCAL_CFLAGS += -DCHECK_FOR_EXTERNAL_FORMAT
endif

LOCAL_SHARED_LIBRARIES := \
        libutils \
        libcutils \
        libui \
        libEGL

LOCAL_C_INCLUDES := $(TOP)/hardware/qcom/display/libgralloc \
LOCAL_CFLAGS := -DLOG_TAG=\"libQcomUI\"

ifneq ($(call is-vendor-board-platform,QCOM),true)
    LOCAL_CFLAGS += -DNON_QCOM_TARGET
else
    LOCAL_SHARED_LIBRARIES += libmemalloc
endif

LOCAL_CFLAGS += -DDEBUG_CALC_FPS

LOCAL_MODULE := libQcomUI
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
