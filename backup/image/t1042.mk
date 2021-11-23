define Device/m200
  DEVICE_VENDOR := WatchGuard
  DEVICE_MODEL := M200
  DEVICE_DTS_DIR := $(DTS_DIR)/fsl
  DEVICE_PACKAGES := kmod-hwmon-lm90 kmod-rtc-ds1307 \
	kmod-gpio-pca953x kmod-eeprom-at24
  BLOCKSIZE := 128k
  KERNEL := kernel-bin | gzip | \
	fit gzip $$(KDIR)/image-$$(DEVICE_DTS).dtb
  SUPPORTED_DEVICES := fsl,T1042RDB_PI
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	pad-rootfs $$(BLOCKSIZE) | append-metadata
endef
TARGET_DEVICES += m200
