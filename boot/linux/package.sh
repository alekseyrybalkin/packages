#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
pkgver=5.1.15
gittag=v${pkgver}

kiin_make() {
    make mrproper
    cp -v ../config-x86_64 .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-arch
}
