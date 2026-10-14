#
# Copyright (C) 2017-2023 The Android Open Source Project
# Copyright (C) 2014-2023 The Team Win LLC
# Copyright (C) 2024-2026 The OrangeFox Recovery Project
# Copyright (C) 2026 AERA Recovery Project contributors
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aera_tornado.mk \
    $(LOCAL_DIR)/twrp_tornado.mk \
    $(LOCAL_DIR)/fox_tornado.mk

COMMON_LUNCH_CHOICES := \
    aera_tornado-bp2a-eng \
    aera_tornado-eng \
    twrp_tornado-bp2a-eng \
    twrp_tornado-eng \
    fox_tornado-bp2a-eng \
    fox_tornado-eng
