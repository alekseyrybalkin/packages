#!/bin/sh

pkgname=libxdamage
pkgver=1.1.4
urls="http://xorg.freedesktop.org/releases/individual/lib/libXdamage-${pkgver}.tar.bz2"
srctar=libXdamage-${pkgver}.tar.bz2
srcdir=${location}/libXdamage-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
