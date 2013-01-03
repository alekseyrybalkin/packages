#!/bin/sh

pkgname=libxinerama
pkgver=1.1.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXinerama-${pkgver}.tar.bz2"
srctar=libXinerama-${pkgver}.tar.bz2
srcdir=${location}/libXinerama-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
