#!/bin/sh

pkgname=xorg-util-macros
pkgver=1.19.0
urls="http://xorg.freedesktop.org/releases/individual/util/util-macros-${pkgver}.tar.bz2"
srctar=util-macros-${pkgver}.tar.bz2
srcdir=${location}/util-macros-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
