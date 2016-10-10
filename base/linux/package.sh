#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux-stable
pkgver=4.8.1
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git revert --no-edit d352cf47d93e39494b44b792cca8d35a3a0bd9b3
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
}
