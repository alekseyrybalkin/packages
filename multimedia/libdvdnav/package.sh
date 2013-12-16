#!/bin/sh

pkgname=libdvdnav
pkgver=4.2.0
urls="http://dvdnav.mplayerhq.hu/releases/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
