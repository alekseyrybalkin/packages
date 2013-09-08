#!/bin/sh

pkgname=libxpm
pkgver=3.5.11
urls="http://xorg.freedesktop.org/releases/individual/lib/libXpm-${pkgver}.tar.bz2"
srctar=libXpm-${pkgver}.tar.bz2
srcdir=${location}/libXpm-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
