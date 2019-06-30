#!/bin/sh

#vcs=none
pkgname=initramfs
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
    true
}

kiin_install() {
    cd ../
    ./mkinitramfs kiin
    mkdir -p ${pkgdir}/boot
    mv -v initrd-kiin ${pkgdir}/boot
}

known="boot/initramfs-linux-fallback.img \
    boot/initramfs-linux.img \
    boot/vmlinuz-linux"
