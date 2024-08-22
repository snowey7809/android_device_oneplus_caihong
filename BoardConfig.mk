#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8650-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/caihong

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5DAAL1,OP5D77L1

# Display
TARGET_SCREEN_DENSITY := 640

# Kernel
BOARD_KERNEL_BINARIES := kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img

INLINE_KERNEL_BUILDING := true

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)-kernel/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(DEVICE_PATH)-kernel/kernel:kernel \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/system_dlkm/,$(TARGET_COPY_OUT_SYSTEM_DLKM)/lib/modules/6.1.57-android14-11-o-g9706572f6d39) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor_dlkm/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor_ramdisk/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules)

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 84

# Include the proprietary files BoardConfig.
include vendor/oneplus/caihong/BoardConfigVendor.mk
