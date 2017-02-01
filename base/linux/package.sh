#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux-stable
pkgver=4.9.7
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
}
