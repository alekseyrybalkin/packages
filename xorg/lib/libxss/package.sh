#!/bin/sh

pkgname=libxss
pkgver=1.2.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXScrnSaver-${pkgver}.tar.bz2"
srctar=libXScrnSaver-${pkgver}.tar.bz2
srcdir=${location}/libXScrnSaver-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
