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
    ./mkinitramfs arch
    mkdir -p ${pkgdir}/boot
    mv -v initrd-kiin ${pkgdir}/boot
    mv -v initrd-arch ${pkgdir}/boot
}
