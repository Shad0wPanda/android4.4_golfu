#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic GSM golfu,
# not specialized for any geography.
#

# First, the most specific values, i.e. the aspects that are specific to GSM

DEVICE_PACKAGE_OVERLAYS := device/htc/golfu/overlay

# Propreties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    ro.ril.disable.power.collapse=0 \
    windowsmgr.max_events_per_sec=120 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.telephony.default_network=3 \
    ro.ril.enable.prl.recognition=1 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.telephony.ril.v3=signalstrengthgsm,singlepdp,apptypesim \
    ro.vold.umsdirtyratio=20

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

#
# Packages required for golfu
#

# Sensors
PRODUCT_PACKAGES += \
    gps.golfu \
    lights.golfu \
    sensors.golfu

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/golfu/init.golfu.rc:root/init.golfu.rc \
    device/htc/golfu/init.golfu.usb.rc:root/init.golfu.usb.rc \
    device/htc/golfu/fstab.golfu:root/fstab.golfu \
    device/htc/golfu/ueventd.golfu.rc:root/ueventd.golfu.rc

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/golfu/golfu-keypad.kl:system/usr/keylayout/golfu-keypad.kl \
    device/htc/golfu/golfu-keypad.kcm:system/usr/keychars/golfu-keypad.kcm \
    device/htc/golfu/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/golfu/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/golfu/h2w_headset.kcm:system/usr/keychars/h2w_headset.kcm \
    device/htc/golfu/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/golfu/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/golfu/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/golfu/sysctl.conf:system/etc/sysctl.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/golfu/media_profiles.xml:system/etc/media_profiles.xml

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/golfu/golfu-vendor.mk)