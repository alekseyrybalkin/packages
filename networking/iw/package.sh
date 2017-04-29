#!/bin/sh

pkgname=iw
pkgver=4.9
vcs=git
gittag=v${pkgver}
urls="https://www.kernel.org/pub/software/network/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=1410

kiin_make() {
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} SBINDIR=/usr/bin install
}
