#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common AOSP configurations
$(call inherit-product, build/make/target/product/full_base_telephony.mk)
$(call inherit-product, build/make/target/product/core_64_bit_only.mk)

# Inherit device-specific configurations
$(call inherit-product, device/xiaomi/socrates/device.mk)

# Inherit LineageOS configurations
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

PRODUCT_NAME := infinity_socrates
PRODUCT_DEVICE := socrates
PRODUCT_MODEL := 22127RK46C
PRODUCT_BRAND := Redmi
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint=Redmi/socrates/socrates:16/BP2A.250605.031.A3/OS3.0.303.0.WMKCNXM:user/release-keys

# Infinity Configs
INFINITY_MAINTAINER := Monstorix
INFINITY_BUILD_TYPE := UNOFFICIAL
WITH_GAPPS := false

# Sign the build
-include vendor/lineage-priv/keys/keys.mk

# Force using release-keys
ifeq ($(TARGET_BUILD_VARIANT),user)
    BUILD_KEYS := release-keys
endif

# replace the prop for release-keys
PRODUCT_PROPERTY_OVERRIDES += ro.build.tags=release-keys
