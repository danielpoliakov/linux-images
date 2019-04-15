#!/bin/sh

ABSPATH=$(readlink -f "$0")
DIRPATH=$(dirname "$ABSPATH")
ROOTFS=$1
KERNEL=$DIRPATH/images/bzImage

qemu-system-i386 -M pc -kernel $KERNEL -drive file=$ROOTFS,if=virtio,format=raw -append "root=/dev/vda console=ttyS0" -net nic,model=e1000 -net user -nographic
