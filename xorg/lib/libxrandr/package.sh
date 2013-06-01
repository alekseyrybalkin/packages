#!/bin/sh

pkgname=libxrandr
pkgver=1.4.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXrandr-${pkgver}.tar.bz2"
srctar=libXrandr-${pkgver}.tar.bz2
srcdir=${location}/libXrandr-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
