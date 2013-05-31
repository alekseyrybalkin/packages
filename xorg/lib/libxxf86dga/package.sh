#!/bin/sh

pkgname=libxxf86dga
pkgver=1.1.4
urls="http://xorg.freedesktop.org/releases/individual/lib/libXxf86dga-${pkgver}.tar.bz2"
srctar=libXxf86dga-${pkgver}.tar.bz2
srcdir=${location}/libXxf86dga-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
