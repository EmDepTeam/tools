##########################################################
# File Name		: prepare.sh
# Author		: winddoing
# Created Time	: 2018年12月13日 星期四 16时18分59秒
# Description	:
##########################################################
#!/bin/bash

function prepare() {
    sudo apt-get -y install qemu qemu-efi-aarch64 gcc-aarch64-linux-gnu uml-utilities bridge-utils
}

prepare
