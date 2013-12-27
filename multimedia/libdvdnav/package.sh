#!/bin/sh

pkgname=libdvdnav
pkgver=4.2.1
urls="http://dvdnav.mplayerhq.hu/releases/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
