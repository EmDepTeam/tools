#!/bin/bash
##########################################################
# File Name		: a.sh
# Author		: winddoing
# Created Time	: 2019年06月24日 星期一 14时53分37秒
# Description	:
##########################################################

# ubuntu下使用qemu安装虚拟机并配置桥接网络
# https://blog.csdn.net/u010817321/article/details/52117344

# sudo apt-get install kvmtool libvirt-bin virtinst virt-manager virt-viewer

qemu-img create -f qcow2 voltdb.img 10g


sudo qemu-system-x86_64 -m 3500 -smp 4 --enable-kvm -boot d -hda source_images.img -cdrom /home/wqshao/software/ubuntu-18.04.1-desktop-amd64.iso -vnc :1

#注：-vnc与:1之间有空格
#在另外一台机器上启动vncviewer，输入192.168.0.123:5902进行连接来进行安装操作和观察安装进度
#注：192.168.0.123为本机IP，5901为相应端口号(5900+1)

sudo apt install vnc4server tigervnc-viewer

# centos7 通过kvm+vnc 实现远程桌面虚拟化和创建windows、Linux虚拟机
# https://blog.csdn.net/qq_21398167/article/details/46413107


