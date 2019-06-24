##########################################################
# File Name		: envsetup.sh
# Author		: winddoing
# Created Time	: 2018年12月10日 星期一 14时17分27秒
# Description	:
##########################################################
#!/bin/bash

MY_PWD=`pwd`
ARCH="arm64"

TOPDIR=${MY_PWD}
echo "------$MY_PWD, $TOPDIR"

if [ $ARCH == "arm64" ]; then
	CROSS_COMPILE=aarch64-linux-gnu-
	export ARCH=arm64
else
	PATH=$PATH:$MY_PWD/arm-linux-gnueabihf/bin/
	CROSS_COMPILE=arm-linux-gnueabihf-
	export ARCH=arm
fi

export TOPDIR PATH CROSS_COMPILE 

echo $PATH
echo $CROSS_COMPILE

echo ""
echo "TOPDIR: ${TOPDIR}"
