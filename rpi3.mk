#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/brcm/rpi3/rpi3-vendor.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet

# Audio
PRODUCT_PACKAGES += \
    audio.primary.rpi3 \
    audio.usb.default

# Graphics
PRODUCT_PACKAGES += \
    gralloc.rpi3 \
    hwcomposer.rpi3 \
    libGLES_mesa

# I2C
#PRODUCT_PACKAGES += \
#    i2cdetect \
#    i2cdump \
#    i2cget \
#    i2cset

# Ramdisk
PRODUCT_PACKAGES += \
	$(LOCAL_PATH)/rootdir/etc/fstab.rpi3:root/recovery.fstab \
	$(LOCAL_PATH)/rootdir/etc/init.rpi3.rc:root/init.rpi3.rc \
	$(LOCAL_PATH)/rootdir/etc/init.usb.rc:root/init.usb3.rc \
	$(LOCAL_PATH)/rootdir/etc/ueventd.rpi3.rc:root/ueventd.rpi3.rc \

# Prebuilt
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.bin:root/lib/firmware/brcm/brcmfmac43430-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.txt:root/lib/firmware/brcm/brcmfmac43430-sdio.txt \
    $(LOCAL_PATH)/firmware/brcm/BCM43430A1.hcd:root/lib/firmware/brcm/BCM43430A1.hcd
