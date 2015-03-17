#!/bin/sh

pkgname=libxfont
pkgver=1.5.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXfont-${pkgver}.tar.bz2"
srctar=libXfont-${pkgver}.tar.bz2
srcdir=${location}/libXfont-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --disable-devel-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
