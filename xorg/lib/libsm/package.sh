#!/bin/sh

pkgname=libsm
pkgver=1.2.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libSM-${pkgver}.tar.bz2"
srctar=libSM-${pkgver}.tar.bz2
srcdir=${location}/libSM-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
