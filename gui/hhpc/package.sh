#!/bin/sh

pkgname=hhpc
SKIP_ARCH_CHECK=1
pkgver=0.3.1
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    make
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/bin
    cp hhpc ${pkgdir}/usr/bin/
}
