#!/bin/sh

pkgname=libxxf86vm
pkgver=1.1.4
urls="http://xorg.freedesktop.org/releases/individual/lib/libXxf86vm-${pkgver}.tar.bz2"
srctar=libXxf86vm-${pkgver}.tar.bz2
srcdir=${location}/libXxf86vm-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
