#!/bin/sh

pkgname=xbitmaps
pkgver=1.1.1
urls="http://xorg.freedesktop.org/releases/individual/data/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
