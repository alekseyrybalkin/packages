#!/bin/sh

pkgname=giflib
pkgver=5.1.9
vcs=git
gittag=${pkgver}
urls="http://downloads.sourceforge.net/giflib/giflib-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=1158

kiin_make() {
    make
}

kiin_install() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
