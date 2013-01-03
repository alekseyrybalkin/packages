#!/bin/sh

pkgname=libx11
pkgver=1.5.0
urls="http://xorg.freedesktop.org/releases/individual/lib/libX11-${pkgver}.tar.bz2"
srctar=libX11-${pkgver}.tar.bz2
srcdir=${location}/libX11-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
