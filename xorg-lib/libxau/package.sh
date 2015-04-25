#!/bin/sh

pkgname=libxau
pkgver=1.0.8
urls="http://xorg.freedesktop.org/releases/individual/lib/libXau-${pkgver}.tar.bz2"
srctar=libXau-${pkgver}.tar.bz2
srcdir=${location}/libXau-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
