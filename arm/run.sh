#!/bin/sh

ABSPATH=$(readlink -f "$0")
DIRPATH=$(dirname "$ABSPATH")
ROOTFS=$1
KERNEL=$DIRPATH/images/zImage
DTB=$DIRPATH/images/vexpress-v2p-ca9.dtb
QEMU_AUDIO_DRV=none

qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel $KERNEL -dtb $DTB -drive file=$ROOTFS,if=sd,format=raw -append "console=ttyAMA0 root=/dev/mmcblk0" -nographic -net nic,model=lan9118 -net user
