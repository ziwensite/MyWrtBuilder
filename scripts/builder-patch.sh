#!/bin/bash

echo "Start Builder Patch !"
echo "Current Path: $PWD"

cd $GITHUB_WORKSPACE/$VENDOR-imagebuilder-$VERSION-x86-64.Linux-x86_64 || exit

# Remove redundant default packages
sed -i "/luci-app-cpufreq/d" include/target.mk

# Force opkg to overwrite files
sed -i "s/install \$(BUILD_PACKAGES)/install \$(BUILD_PACKAGES) --force-overwrite/" Makefile

# Not generate ISO images for it is too big
sed -i "s/CONFIG_ISO_IMAGES=y/# CONFIG_ISO_IMAGES is not set/" .config

# Not generate VDI images for it is too big
sed -i "s/CONFIG_VDI_IMAGES=y/# CONFIG_VDI_IMAGES is not set/" .config

# Not generate QCOW2 images for it is too big
sed -i "s/CONFIG_QCOW2_IMAGES=y/# CONFIG_QCOW2_IMAGES is not set/" .config

# Not generate GZIP images for it is too big
# sed -i "s/CONFIG_TARGET_IMAGES_GZIP=y/# CONFIG_TARGET_IMAGES_GZIP is not set/" .config

# Not generate EXT4FS images for it is too big
sed -i "s/CONFIG_TARGET_ROOTFS_EXT4FS=y/# CONFIG_TARGET_ROOTFS_EXT4FS is not set/" .config

# Not generate ROOTFS_CPIOGZ images for it is too big
# sed -i "s/CONFIG_TARGET_ROOTFS_CPIOGZ=y/# CONFIG_TARGET_ROOTFS_CPIOGZ is not set/" .config

# Not generate ROOTFS_TARGZ images for it is too big
sed -i "s/CONFIG_TARGET_ROOTFS_TARGZ=y/# CONFIG_TARGET_ROOTFS_TARGZ is not set/" .config

# Not generate ROOTFS_SQUASHFS images for it is too big
# sed -i "s/CONFIG_TARGET_ROOTFS_SQUASHFS=y/# CONFIG_TARGET_ROOTFS_SQUASHFS is not set/" .config

# Not generate VMDK images
sed -i "s/CONFIG_VMDK_IMAGES=y/# CONFIG_VMDK_IMAGES is not set/" .config

# Not generate VHDX images
# sed -i "s/CONFIG_VHDX_IMAGES=y/# CONFIG_VHDX_IMAGES is not set/" .config

# Increase rootfs partition size to 500M
sed -i "s/CONFIG_TARGET_ROOTFS_PARTSIZE=300/CONFIG_TARGET_ROOTFS_PARTSIZE=1024/" .config

# /sbin/mount.cifs 
ln -s /usr/sbin/mount.cifs /sbin/mount.cifs

