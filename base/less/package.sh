#!/bin/sh

#vcs=none
pkgname=less
pkgver=487
urls="http://www.greenwoodsoftware.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
# beta versions
#relmon_id=1550

undead_make() {
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

undead_install() {
    make prefix=${pkgdir}/usr install
}
