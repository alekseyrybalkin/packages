#!/bin/sh

pkgname=xkeyboard-config
pkgver=2.12
urls="http://xorg.freedesktop.org/releases/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --with-xkb-rules-symlink=xorg
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
