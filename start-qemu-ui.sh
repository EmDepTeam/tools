#!/bin/bash

qemu-system-arm -M vexpress-a9 -m 512M \
  -dtb ./for_qemu/vexpress-v2p-ca9.dtb \
  -kernel ./for_qemu/zImage \
  -append "root=/dev/mmcblk0 rw console=ttyAMA0 init=/bin/sh" \
  -sd ./for_qemu/rootfs.ext4

