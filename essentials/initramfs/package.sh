#!/bin/sh

#vcs=none
pkgname=initramfs
SKIP_ARCH_CHECK=1
pkgver=1

undead_make() {
    true
}

undead_install() {
    cd ../
    ./mkinitramfs
    mkdir -p ${pkgdir}/boot
    mv -v initrd.img ${pkgdir}/boot
}
