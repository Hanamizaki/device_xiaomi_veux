#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/veux
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := veux

# Camera
TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED := true

# HIDL
ODM_MANIFEST_SKUS += \
    sn100

NFC_ESE_MANIFEST := $(DEVICE_PATH)/hidl/nfc_ese.xml

ODM_MANIFEST_SN100_FILES := \
    $(DEVICE_PATH)/manifest_ese.xml

# Kernel
TARGET_KERNEL_CONFIG := veux_defconfig

# Kernel modules
BOOT_KERNEL_MODULES := \
  fts_touch_spi.ko \
  hwid.ko \
  msm_drm.ko \
  xiaomi_touch.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := veux|peux

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 113254576128

# Vibrator
SOONG_CONFIG_xiaomiSm8350Vars_vibrator_use_effect_stream := true

# Inherit from proprietary files
include vendor/xiaomi/veux/BoardConfigVendor.mk
