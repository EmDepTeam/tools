#!/bin/bash

qemu-system-arm -M vexpress-a9 \
    -kernel ./for_qemu/u-boot \
    -nographic \
    -m 512M \
    -sd ./for_qemu/rootfs.ext4  
