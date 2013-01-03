#!/bin/sh

pkgname=libxft
pkgver=2.3.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXft-${pkgver}.tar.bz2"
srctar=libXft-${pkgver}.tar.bz2
srcdir=${location}/libXft-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
