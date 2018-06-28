#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
pkgver=4.14.32
gittag=v${pkgver}

undead_make() {
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

undead_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-undead
}
