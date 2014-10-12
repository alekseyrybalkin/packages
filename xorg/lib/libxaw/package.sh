#!/bin/sh

pkgname=libxaw
pkgver=1.0.12
urls="http://xorg.freedesktop.org/releases/individual/lib/libXaw-${pkgver}.tar.bz2"
srctar=libXaw-${pkgver}.tar.bz2
srcdir=${location}/libXaw-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
