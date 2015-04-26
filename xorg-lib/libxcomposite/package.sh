#!/bin/sh

pkgname=libxcomposite
pkgver=0.4.4
urls="http://xorg.freedesktop.org/releases/individual/lib/libXcomposite-${pkgver}.tar.bz2"
srctar=libXcomposite-${pkgver}.tar.bz2
srcdir=${location}/libXcomposite-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}