#!/bin/sh

pkgname=xcb-util
pkgver=0.3.9
urls="http://xorg.freedesktop.org/releases/individual/xcb/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
