##########################################################
# File Name		: gdb_client.sh
# Author		: winddoing
# Created Time	: 2018年12月13日 星期四 17时36分34秒
# Description	:
##########################################################
#!/bin/bash

ARCH=arm64
VMLINUX="${TOPDIR}/image_file/vmlinux"

if [ $ARCH == "arm64" ]; then
	aarch64-linux-gdb $VMLINUX
else
	arm-linux-gdb $VMLINUX
fi
