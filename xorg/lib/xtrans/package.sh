#!/bin/sh

pkgname=xtrans
pkgver=1.2.7
urls="http://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
