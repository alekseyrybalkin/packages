#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
pkgver=5.2.1
gittag=v${pkgver}

kiin_make() {
    make mrproper
    cp -v ../config-x86_64 .config
    make
    make htmldocs
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-arch
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r Documentation/output ${pkgdir}/usr/share/doc/linux
}
