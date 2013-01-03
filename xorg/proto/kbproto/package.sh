#!/bin/sh

pkgname=kbproto
pkgver=1.0.6
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
