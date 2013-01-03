#!/bin/sh

pkgname=libice
pkgver=1.0.8
urls="http://xorg.freedesktop.org/releases/individual/lib/libICE-${pkgver}.tar.bz2"
srctar=libICE-${pkgver}.tar.bz2
srcdir=${location}/libICE-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
