#!/bin/sh

#vcs=none
pkgname=which
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
    :
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/bin
    cp which.sh ${pkgdir}/usr/bin/which
    chmod 755 ${pkgdir}/usr/bin/which
}
