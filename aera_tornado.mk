#
# Copyright (C) 2026 AERA Recovery Project contributors
# Device: Xiaomi Redmi 15C 5G (tornado)
# Branch: AERA 16.0
# SoC   : MediaTek Dimensity 6100+ (MT6835)
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/tornado

# Inherit from core products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure virtual_ab compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Configure emulated storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure vendor recovery / twrp common configuration
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)
$(call inherit-product-if-exists, vendor/recovery/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Device identifier
BOARD_VENDOR := xiaomi
PRODUCT_DEVICE := tornado
PRODUCT_NAME := aera_tornado
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 15C 5G
PRODUCT_MANUFACTURER := Xiaomi

# Assert
TARGET_OTA_ASSERT_DEVICE := tornado

# UI
AERA_STATUS_ICONS_ALIGN := center
