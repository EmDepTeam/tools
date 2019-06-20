#!/bin/bash

ARCH=arm64

ROOTFS="${TOPDIR}/image_file/rootfs.ext4"

if [ $ARCH == "arm64" ]; then
	KERNEL="${TOPDIR}/image_file/Image"

	echo "Qemu for arm64 ..."
	qemu-system-aarch64 -machine virt \
		-cpu cortex-a57 -m 2048 -smp 2 \
		-kernel for_qemu/Image -nographic \
		-append "root=/dev/vda rw console=ttyAMA0 115200 loglevel=8" \
		-hda for_qemu/rootfs.ext4 \
		-s -S
else
	KERNEL="${TOPDIR}/image_file/zImage"
	DTB="${TOPDIR}/image_file/vexpress-v2p-ca9.dtb"
	
	echo "Qemu for arm ..."
	qemu-system-arm -M vexpress-a9 -m 512M \
		-dtb ./for_qemu/vexpress-v2p-ca9.dtb \
		-kernel ./for_qemu/zImage -nographic \
		-append "root=/dev/mmcblk0 rw console=ttyAMA0 init=/bin/sh" \
		-sd ./for_qemu//rootfs.ext4 \
		-s -S
fi

