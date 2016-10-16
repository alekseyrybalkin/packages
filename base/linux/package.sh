#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux-stable
pkgver=4.8.2
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git cherry-pick abb6627910a1e783c8e034b35b7c80e5e7f98f41
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
}
