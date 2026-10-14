#
# Copyright (C) 2026 AERA Recovery Project contributors
# Compatibility makefile for legacy lunch targets
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/tornado

$(call inherit-product, $(DEVICE_PATH)/aera_tornado.mk)

PRODUCT_NAME := fox_tornado
