#!/bin/sh

pkgname=libxvmc
pkgver=1.0.8
urls="http://xorg.freedesktop.org/releases/individual/lib/libXvMC-${pkgver}.tar.bz2"
srctar=libXvMC-${pkgver}.tar.bz2
srcdir=${location}/libXvMC-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
