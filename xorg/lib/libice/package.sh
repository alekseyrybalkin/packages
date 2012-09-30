#!/bin/sh

pkgname=libice
pkgver=1.0.8
urls="http://xorg.freedesktop.org/releases/individual/lib/libICE-${pkgver}.tar.bz2"
srctar=libICE-${pkgver}.tar.bz2
srcdir=${location}/libICE-${pkgver}

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
