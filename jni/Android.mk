LOCAL_PATH := $(call my-dir)
BASE_DIR   := $(LOCAL_PATH)/../../../..
CORE_DIR   := $(BASE_DIR)/src

INCFLAGS := -I$(CORE_DIR) \
   -I$(CORE_DIR)/hw

INCFLAGS += -I$(LIBRETRO_COMM_DIR)/include \
   -I$(LIBRETRO_COMM_DIR)/include/compat \
   -I$(LIBRETRO_COMM_DIR)/include/encodings \
   -I$(LIBRETRO_COMM_DIR)/include/file \
   -I$(LIBRETRO_COMM_DIR)/include/streams \
   -I$(LIBRETRO_COMM_DIR)/include/string \
   -I$(LIBRETRO_COMM_DIR)/include/vfs

include $(BASE_DIR)/Makefile.common

COREFLAGS := -D__LIBRETRO__

include $(CLEAR_VARS)
LOCAL_MODULE    := retro
LOCAL_SRC_FILES := $(SOURCES_C) $(SOURCES_CXX)
LOCAL_CFLAGS    := $(COREFLAGS)
LOCAL_CPPFLAGS  := $(COREFLAGS)
LOCAL_CXXFLAGS  := $(COREFLAGS)
LOCAL_LDFLAGS   := -Wl,-version-script=$(BASE_DIR)/link.T
include $(BUILD_SHARED_LIBRARY)
