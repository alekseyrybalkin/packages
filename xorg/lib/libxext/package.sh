#!/bin/sh

pkgname=libxext
pkgver=1.3.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXext-${pkgver}.tar.bz2"
srctar=libXext-${pkgver}.tar.bz2
srcdir=${location}/libXext-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
