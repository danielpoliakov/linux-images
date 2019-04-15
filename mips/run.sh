#!/bin/sh

ABSPATH=$(readlink -f "$0")
DIRPATH=$(dirname "$ABSPATH")
ROOTFS=$1
KERNEL=$DIRPATH/images/vmlinux

qemu-system-mips -kernel $KERNEL -hda $ROOTFS -append "root=/dev/hda console=ttyS0" -nographic -device virtio-serial
