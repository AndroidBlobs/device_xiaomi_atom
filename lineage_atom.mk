# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from atom device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := xiaomi
PRODUCT_DEVICE := atom
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_NAME := lineage_atom
PRODUCT_MODEL := M2004J7AC

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
TARGET_VENDOR := xiaomi
TARGET_VENDOR_PRODUCT_NAME := atom
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="atom-user 10 QP1A.190711.020 V11.0.2.0.QJHCNXM release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Redmi/atom/atom:10/QP1A.190711.020/V11.0.2.0.QJHCNXM:user/release-keys
