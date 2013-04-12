#!/bin/sh

pkgname=libmpdclient
pkgver=2.8
urls="http://www.musicpd.org/download/${pkgname}/2/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --disable-documentation
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
