#!/bin/sh

pkgname=libpthread-stubs
pkgver=0.3
urls="http://xcb.freedesktop.org/dist/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --docdir='${datadir}'/doc/${pkgname}-${pkgver}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
