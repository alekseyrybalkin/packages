#!/bin/sh

pkgname=libxmu
pkgver=1.1.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXmu-${pkgver}.tar.bz2"
srctar=libXmu-${pkgver}.tar.bz2
srcdir=${location}/libXmu-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
