#
# SYSTEM PROPERTIES FOR ANGLER
#

##### AUDIO #####

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

# For qcom modify fluence type name, here added and enable
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype="fluence" \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.product.identify="angler" \
    persist.audio.fluence.speaker=true

# Stereo speakers: orientation changes swap L/R channels
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.monitorRotation=true

# Low audio flinger standby delay to reduce power consumption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.flinger_standbytime_ms=300

##### CAMERA #####

# Enable camera EIS
# eis.enable: enables electronic image stabilization
# is_type: sets image stabilization type
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.eis.enable=1 \
    persist.camera.is_type=4 \
    persist.vendor.camera.privapp.list=org.lineageos.snap,com.google.android.GoogleCamera \
    vendor.camera.aux.packagelist=org.lineageos.snap,com.google.android.GoogleCamera

##### DALVIK VM #####

# limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=4 \
    dalvik.vm.dex2oat-threads=4 \
    dalvik.vm.image-dex2oat-threads=4

##### DISPLAY #####

# Disable sf latch buffer signaled property
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.latch_unsignaled=1

# Disable SF backpressure
    debug.sf.disable_backpressure=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=560

PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

##### DRM SERVICE #####

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

##### FACELOCK #####

PRODUCT_PROPERTY_OVERRIDES += \
    ro.facelock.black_timeout=700 \
    ro.facelock.det_timeout=2500 \
    ro.facelock.rec_timeout=3500 \
    ro.facelock.est_max_time=600

##### FACTORY RESET PROTECTION #####

PRODUCT_PROPERTY_OVERRIDES += \
   ro.frp.pst=/dev/block/platform/soc.0/f9824900.sdhci/by-name/frp

##### HWUI #####

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

##### MEDIA #####

# Disable codec2
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.ccodec=0 

# Default OMX service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Enable low power video mode for 4K encode
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.perf.mode=2 \
    vidc.enc.dcvs.extra-buff-count=2

# Write Manufacturer & Model information in created media files.
# IMPORTANT: ONLY SET THIS PROPERTY TO TRUE FOR PUBLIC DEVICES
ifneq ($(filter lineage_angler% angler%, $(TARGET_PRODUCT)),)
PRODUCT_PROPERTY_OVERRIDES += \
    media.recorder.show_manufacturer_and_model=true
else
$(error "you must decide whether to write manufacturer and model information into created media files for this device. ONLY ENABLE IT FOR PUBLIC DEVICE.")
endif  #TARGET_PRODUCT

##### OEM CUSTOMIZATION #####

PRODUCT_OEM_PROPERTIES := \
    ro.config.ringtone \
    ro.config.notification_sound \
    ro.config.alarm_alert \
    ro.config.wallpaper \
    ro.config.wallpaper_component \
    ro.oem.* \
    oem.*

##### OEM UNLOCK REPORTING #####

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

##### PERFD #####

PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=384000 \
    ro.min_freq_4=384000 \
    ro.vendor.extension_library=libqti-perfd-client.so

##### RADIO #####

PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.data_no_toggle=1 \
    persist.radio.data_con_rprt=true \
    persist.data.mode=concurrent

# Disable radio power savvving
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.add_power_save=0

# Setup custom emergency number list based on the MCC. This is needed by RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.custom_ecc=1

# Request modem to send PLMN name always irrespective
# of display condition in EFSPN.
# RIL uses this property.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.always_send_plmn=true

# Update 1x signal strength after 2s
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.radio.snapshot_enabled=1 \
    persist.radio.snapshot_timer=2

# Mobile Data provision prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.prov_mobiledata=false

# If data_no_toggle is 0 there are no reports if the screen is off.
# If data_no_toggle is 1 then dormancy indications will come with screen off.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.data_no_toggle=1

# Incoming number (b/23529711)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.redir_party_num=0

##### SHIPPING API #####
PRODUCT_SHIPPING_API_LEVEL := 23

# Modem debugger
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
ifeq (,$(filter lineage_angler, $(TARGET_PRODUCT)))
PRODUCT_PACKAGES += \
    NexusLogger
endif # lineage_angler

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.angler.diag.rc.userdebug:root/init.angler.diag.rc

##### SUBSYSTEM RAMDUMP COLLECTON #####

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.enable_ramdumps=0
else # userdebug eng
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.angler.diag.rc.user:root/init.angler.diag.rc
endif # userdebug eng

##### SUBSYSTEM RESTART #####

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.restart_level="ALL_ENABLE"

##### TELEPHONY #####

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_cdma_sub=0

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10 \
    telephony.lteOnCdmaDevice=1 \

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0

# Enable Wifi calling
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true












