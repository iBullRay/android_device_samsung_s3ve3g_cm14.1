# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017, The LineageOS Project
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

# Inherit from msm8226-common
$(call inherit-product, device/samsung/msm8226-common/msm8226.mk)

# Also get non-open-source specific aspects
$(call inherit-product, vendor/samsung/s3ve3g/s3ve3g-vendor.mk)

DEVICE_PATH := device/samsung/s3ve3g

# Audio configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(DEVICE_PATH)/configs/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# NFC
# See https://github.com/LineageOS/android_external_libnfc-nci/blob/cm-14.1/halimpl/pn54x/Android.mk#L15
# for magic values of NXP_CHIP_TYPE.
NXP_CHIP_TYPE := 1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    $(DEVICE_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
    libpn547_fw \
    nfc_nci.pn54x.default \
    com.android.nfc_extras \
    NfcNci \
    Tag

# Wifi
PRODUCT_PACKAGES += \
    hostapd_default.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin