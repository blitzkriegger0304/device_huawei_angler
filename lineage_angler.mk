#
# Copyright 2015 The Android Open Source Project
# Copyright 2021 The LineageOS Project
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
#

# Get the long list of APNs
PRODUCT_COPY_FILES := $(LOCAL_PATH)/apns-full-conf.xml:system/etc/apns-conf.xml

#Inherit from device
$(call inherit-product, $(LOCAL_PATH)/device.mk)
$(call inherit-product-if-exists, vendor/huawei/angler/angler-vendor.mk)

# Inherit from LineageOS
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Device Identifier
PRODUCT_NAME := lineage_angler
PRODUCT_DEVICE := angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Device Release Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    PRIVATE_BUILD_DESC="angler-user 8.1.0 OPM7.181205.001 5080180 release-keys"

BUILD_FINGERPRINT := google/angler/angler:8.1.0/OPM7.181205.001/5080180:user/release-keys

PRODUCT_PACKAGES += \
    Launcher3 \
    WallpaperPicker

PRODUCT_PACKAGES += \
    AOSPLinks