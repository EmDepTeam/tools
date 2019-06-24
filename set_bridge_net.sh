#!/bin/bash
##########################################################
# File Name		: set_bridge_net.sh
# Author		: winddoing
# Created Time	: 2019年06月23日 星期日 18时22分50秒
# Description	:
##########################################################

sudo ifconfig br0 down
sudo ifconfig tap0 down

sudo brctl delif br0 tap0
sudo brctl delbr br0

sudo brctl addbr br0
sudo ifconfig br0 192.168.42.13
sudo ifconfig br0 up

sudo ifconfig tap0 0.0.0.0 promisc up

sudo brctl addif br0 tap0

brctl show
