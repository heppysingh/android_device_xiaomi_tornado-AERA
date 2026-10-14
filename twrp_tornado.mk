#
# Copyright (C) 2026 AERA Recovery Project contributors
# Device: Xiaomi Redmi 15C 5G (tornado)
# Branch: AERA 16.0
# SoC   : MediaTek Dimensity 6100+ (MT6835)
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/tornado

# Inherit from aera_tornado configuration
$(call inherit-product, $(DEVICE_PATH)/aera_tornado.mk)

PRODUCT_NAME := twrp_tornado
