#!/bin/sh

pkgname=libxtst
pkgver=1.2.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXtst-${pkgver}.tar.bz2"
srctar=libXtst-${pkgver}.tar.bz2
srcdir=${location}/libXtst-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
