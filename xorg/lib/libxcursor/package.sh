#!/bin/sh

pkgname=libxcursor
pkgver=1.1.13
urls="http://xorg.freedesktop.org/releases/individual/lib/libXcursor-${pkgver}.tar.bz2"
srctar=libXcursor-${pkgver}.tar.bz2
srcdir=${location}/libXcursor-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
