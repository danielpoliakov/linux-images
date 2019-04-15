#!/bin/sh

ABSPATH=$(readlink -f "$0")
DIRPATH=$(dirname "$ABSPATH")
ROOTFS=$1
KERNEL=$DIRPATH/images/Image
QEMU_AUDIO_DRV=none

qemu-system-aarch64 -M virt -cpu cortex-a57 -smp 1 -m 256 -kernel $KERNEL -drive file=$ROOTFS,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "console=ttyAMA0 root=/dev/vda" -nographic -netdev user,id=eth0 -device virtio-net-device,netdev=eth0
