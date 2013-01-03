#!/bin/sh

pkgname=libxrender
pkgver=0.9.7
urls="http://xorg.freedesktop.org/releases/individual/lib/libXrender-${pkgver}.tar.bz2"
srctar=libXrender-${pkgver}.tar.bz2
srcdir=${location}/libXrender-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
