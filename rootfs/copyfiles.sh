#!/bin/sh
rm /mnt/rootfs/qtexport /mnt/rootfs/profile /mnt/rootfs/ethcfg /mnt/rootfs/rc.conf /mnt/rootfs/inittab

cp /etc/rc.d/init.d/qtexport /mnt/rootfs
cp /etc/rc.d/init.d/ethcfg /mnt/rootfs
cp /etc/profile /mnt/rootfs
cp /etc/rc.d/rc.conf /mnt/rootfs
cp /etc/inittab /mnt/rootfs

