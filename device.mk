#
# Copyright (C) 2020 The LineageOS Project
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

# This file includes all definitions that apply to ALL angler devices, and
# are also specific to angler devices
#
# Everything in this directory will become public

# Enable support for chinook sensorhub
TARGET_USES_CHINOOK_SENSORHUB := false

PRODUCT_SHIPPING_API_LEVEL := 23

PRODUCT_COPY_FILES += \
    device/huawei/angler/init.angler.rc:root/init.angler.rc \
    device/huawei/angler/init.angler.usb.rc:root/init.angler.usb.rc \
    device/huawei/angler/fstab.angler:root/fstab.angler \
    device/huawei/angler/ueventd.angler.rc:root/ueventd.angler.rc \
    device/huawei/angler/init.recovery.angler.rc:root/init.recovery.angler.rc \
    device/huawei/angler/init.angler.power.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.angler.power.sh \
    device/huawei/angler/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    device/huawei/angler/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    device/huawei/angler/init.qcom.devwait.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.devwait.sh \
    device/huawei/angler/init.qcom.devstart.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.devstart.sh

ifeq ($(TARGET_USES_CHINOOK_SENSORHUB),true)
PRODUCT_COPY_FILES += \
    device/huawei/angler/init.angler.sensorhub.rc:root/init.angler.sensorhub.rc
else
PRODUCT_COPY_FILES += \
    device/huawei/angler/init.angler.nanohub.rc:root/init.angler.sensorhub.rc
endif

PRODUCT_COPY_FILES += \
    device/huawei/angler/init.mcfg.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mcfg.sh

PRODUCT_COPY_FILES += \
    device/huawei/angler/init.radio.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.radio.sh

# Thermal configuration
PRODUCT_COPY_FILES += \
    device/huawei/angler/thermal-engine-angler.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/thermal-engine.conf

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video.xml \
    device/huawei/angler/media_codecs.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs.xml \
    device/huawei/angler/media_codecs_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_performance.xml \
    device/huawei/angler/media_profiles.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml

# APEX
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ld.config.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/swcodec/ld.config.txt

# Audio
PRODUCT_COPY_FILES += \
    device/huawei/angler/aanc_tuning_mixer.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/aanc_tuning_mixer.txt \
    device/huawei/angler/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    device/huawei/angler/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/huawei/angler/mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/mixer_paths.xml \
    device/huawei/angler/audio_platform_info_i2s.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_platform_info_i2s.xml \
    device/huawei/angler/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths.xml \
    device/huawei/angler/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_platform_info.xml \
    device/huawei/angler/audio_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_platform_info.xml \
    device/huawei/angler/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    device/huawei/angler/audio_policy_volumes_drc.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes_drc.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default_volume_tables.xml \

# Input device files
PRODUCT_COPY_FILES += \
    device/huawei/angler/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    device/huawei/angler/qpnp_pon.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/qpnp_pon.kl \
    device/huawei/angler/synaptics_dsx.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/synaptics_dsx.idc

# for launcher layout
#PRODUCT_PACKAGES += \
#    AnglerLayout

# Fingerprint Sensor
PRODUCT_PACKAGES += \
    fingerprint.angler 

PRODUCT_COPY_FILES += \
    device/huawei/angler/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# System Properties
-include $(LOCAL_PATH)/system_prop.mk

# Wifi
PRODUCT_COPY_FILES += \
    device/huawei/angler/bcmdhd.cal:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/bcmdhd.cal \
    device/huawei/angler/bcmdhd-pme.cal:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/bcmdhd-pme.cal \
    device/huawei/angler/bcmdhd-high.cal:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/bcmdhd-high.cal \
    device/huawei/angler/bcmdhd-low.cal:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/bcmdhd-low.cal \
    device/huawei/angler/filter_ie:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/filter_ie

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vulkan.version.xml

$(call inherit-product, device/huawei/angler/utils.mk)

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/huawei/angler/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

PRODUCT_TAGS += dalvik.gc.type-precise

# This device is 560dpi.  However the platform doesn't
# currently contain all of the bitmaps at 560dpi density so
# we do this little trick to fall back to the xxhdpi version
# if the 560dpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_PACKAGES += \
    gralloc.msm8994 \
    hwcomposer.msm8994 \
    libgenlock \
    memtrack.msm8994 

USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_PACKAGES += \
    audio.primary.msm8994 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    dsm_ctrl

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc

#CAMERA
PRODUCT_PACKAGES += \
    camera.msm8994 \
    libcamera \
    libmmcamera_interface \
    libmmcamera_interface2 \
    libmmjpeg_interface \
    libqomx_core \
    mm-qcamera-app

# GoogleCamera
$(call inherit-product, packages/apps/GoogleCamera/gcam.mk)

# GPS
PRODUCT_PACKAGES += \
    libgps.utils \
    libgnss \
    liblocation_api \
    gps.msm8994

# Sensor & activity_recognition HAL
TARGET_USES_NANOHUB_SENSORHAL := true
NANOHUB_SENSORHAL_LID_STATE_ENABLED := true
NANOHUB_SENSORHAL_USB_MAG_BIAS_ENABLED := true
NANOHUB_SENSORHAL_SENSORLIST := $(LOCAL_PATH)/sensorhal/sensorlist.cpp
NANOHUB_SENSORHAL_DIRECT_REPORT_ENABLED := true

PRODUCT_PACKAGES += \
    sensors.angler \
    activity_recognition.angler

ifeq ($(TARGET_USES_CHINOOK_SENSORHUB),true)
PRODUCT_PACKAGES += \
    sensortool.angler \
    nano4x1.bin
else
PRODUCT_PACKAGES += \
    nanoapp_cmd
endif

# sensor utilities (only for userdebug and eng builds)
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += \
    nanotool \
    sensortest
endif

# for off charging mode
PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wlutil \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf

# Bluetooth HAL
PRODUCT_PACKAGES += \
    libbt-vendor 

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag 

# Privapp Whitelist
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/configs/privapp-permissions-angler.xml:system/etc/permissions/privapp-permissions-angler.xml
	
# TimeKeep
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# Library used for VTS tests  (only for userdebug and eng builds)
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))

# For VTS profiling.
PRODUCT_PACKAGES += \
     libvts_profiling \
     libvts_multidevice_proto
endif

PRODUCT_COPY_FILES += \
    device/huawei/angler/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf \
    device/huawei/angler/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nxp.conf

DEVICE_PACKAGE_OVERLAYS := \
    device/huawei/angler/overlay

PRODUCT_PACKAGES += \
    telephony-ext \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \

PRODUCT_BOOT_JARS += \
    telephony-ext

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
   fs_config_files

# For data
PRODUCT_PACKAGES += \
   librmnetctl

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/qcom/msm8994/msm8994.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8994/msm8994-gpu-vendor.mk)

# WiFi configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# copy wlan firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4358/device-bcm.mk)

# GPS configuration
PRODUCT_COPY_FILES += \
    device/huawei/angler/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf:qcom

# services for encryption
PRODUCT_PACKAGES += \
    gatekeeper.msm8994 \

# general support
PRODUCT_PACKAGES += \
    libtinyxml

# verity
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc.0/f9824900.sdhci/by-name/system
$(call inherit-product, build/target/product/verity.mk)

# Write flags to the vendor space in /misc partition.
PRODUCT_PACKAGES += \
    misc_writer

# b/29995499
$(call add-product-sanitizer-module-config,cameraserver,never)
$(call add-product-sanitizer-module-config,mm-qcamera-daemon,never)

# b/36201281
$(call add-product-sanitizer-module-config,thermal-engine,never)
$(call add-product-sanitizer-module-config,qmuxd,never)

# HIDL
$(call inherit-product, $(LOCAL_PATH)/hidl.mk)