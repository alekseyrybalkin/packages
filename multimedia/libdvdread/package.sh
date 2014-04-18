#!/bin/sh

pkgname=libdvdread
pkgver=4.9.9
urls="http://dvdnav.mplayerhq.hu/releases/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static \
    --docdir=/usr/share/doc/libdvdread
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
