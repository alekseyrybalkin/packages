#!/bin/sh

pkgname=xcursor-themes
pkgver=1.0.4
urls="http://xorg.freedesktop.org/releases/individual/data/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
