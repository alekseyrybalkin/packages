#!/bin/sh

pkgname=randrproto
pkgver=1.4.1
urls="http://xorg.freedesktop.org/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
