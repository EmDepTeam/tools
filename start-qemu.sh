#!/bin/bash
if [ ! -n "${TOPDIR}" ];then
	echo "Please execute the command (source envsetup.sh) in the project root directory"
	exit 1;
fi

ARCH=arm64

ROOTFS="${TOPDIR}/image_file/rootfs.ext4"

if [ $ARCH == "arm64" ]; then
	KERNEL="${TOPDIR}/image_file/Image"

	echo "Qemu for arm64 ..."
	qemu-system-aarch64 -machine virt \
		-cpu cortex-a57 -m 2048 -smp 2 \
		-kernel ${KERNEL} -nographic \
		-append "root=/dev/vda rw console=ttyAMA0 115200 loglevel=8" \
		-hda ${ROOTFS} \
		-fsdev local,security_model=passthrough,id=fsdev0,path=/home/wqshao/nfs \
		-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare
else
	KERNEL="${TOPDIR}/image_file/zImage"
	DTB="${TOPDIR}/image_file/vexpress-v2p-ca9.dtb"

	echo "Qemu for arm ..."
	qemu-system-arm -M vexpress-a9 -m 512M \
		-dtb ${DTB} \
		-kernel ${KERNEL} -nographic \
		-append "root=/dev/mmcblk0 rw console=ttyAMA0 init=/bin/sh" \
		-sd ${ROOTFS}
fi
