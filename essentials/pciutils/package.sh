#!/bin/sh

pkgname=pciutils
pkgver=3.5.4
vcs=git
gittag=v${pkgver}
relmon_id=2605

kiin_make() {
    make PREFIX=/usr \
        SHAREDIR=/usr/share/hwdata \
        SHARED=yes
}

kiin_install() {
    make PREFIX=/usr \
        SHAREDIR=/usr/share/hwdata \
        SHARED=yes \
        SBINDIR=/usr/bin \
        DESTDIR=${pkgdir} \
        install install-lib
}
