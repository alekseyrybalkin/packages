#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
_ver=4.13
_rc=rc2
pkgver=${_ver}.${_rc}
gittag=v${_ver}-${_rc}
#pkgver=4.12.4
#gittag=v${pkgver}

kiin_make() {
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
}
