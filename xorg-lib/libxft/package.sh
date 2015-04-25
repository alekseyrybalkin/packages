#!/bin/sh

pkgname=libxft
pkgver=2.3.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXft-${pkgver}.tar.bz2"
srctar=libXft-${pkgver}.tar.bz2
srcdir=${location}/libXft-${pkgver}

kiin_make() {
  sed -i -e 's/<freetype/<freetype2/g' src/xftglyphs.c
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
