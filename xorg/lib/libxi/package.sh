#!/bin/sh

pkgname=libxi
pkgver=1.6.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXi-${pkgver}.tar.bz2"
srctar=libXi-${pkgver}.tar.bz2
srcdir=${location}/libXi-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
