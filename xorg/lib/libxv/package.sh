#!/bin/sh

pkgname=libxv
pkgver=1.0.8
urls="http://xorg.freedesktop.org/releases/individual/lib/libXv-${pkgver}.tar.bz2"
srctar=libXv-${pkgver}.tar.bz2
srcdir=${location}/libXv-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
