#!/bin/sh

pkgname=libev
pkgver=4.27
#vcs=none
urls="http://dist.schmorp.de/libev/libev-${pkgver}.tar.gz"
srctar=libev-${pkgver}.tar.gz
srcdir=${location}/libev-${pkgver}
relmon_id=1605

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm ${pkgdir}/usr/include/event.h
}
