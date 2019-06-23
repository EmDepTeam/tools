

## 交叉编译器

官网:https://www.linaro.org

下载地址:

[https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz)





## Qemu

版本:
```
$qemu-system-arm --version
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.8)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

$qemu-system-aarch64 --version
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.9)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
```


退出: Ctrl+a+x

### start

```
qemu-system-aarch64 -machine virt \
	-cpu cortex-a57 -m 2048 -smp 2 \
	-kernel for_qemu/Image -nographic \
	-append "root=/dev/vda rw console=ttyAMA0 115200 loglevel=8" \
	-hda for_qemu/rootfs.ext4 \
	-fsdev local,security_model=passthrough,id=fsdev0,path=/home/wqshao/nfs \
	-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare
```

- 共享目录

```
	-fsdev local,security_model=passthrough,id=fsdev0,path=/home/wqshao/nfs \
	-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare
```

使用：

```
mount -t 9p -o trans=virtio,version=9p2000.L hostshare /mnt2
```
- 共享网络

```
	-device e1000e,netdev=dev0,mac='00:00:00:01:00:01'\
	-netdev tap,ifname=tap-int,id=dev0,script=no,downscript=no,vhost=on

```


qemu-system-aarch64: -netdev tap,ifname=tap-int,id=dev0,script=no,downscript=no,vhost=on: could not open /dev/net/tun: No such file or directory

