#!/bin/sh

pkgname=libxfixes
pkgver=5.0
urls="http://xorg.freedesktop.org/releases/individual/lib/libXfixes-${pkgver}.tar.bz2"
srctar=libXfixes-${pkgver}.tar.bz2
srcdir=${location}/libXfixes-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
