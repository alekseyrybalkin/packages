#!/bin/sh

pkgname=libxp
pkgver=1.0.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXp-${pkgver}.tar.bz2"
srctar=libXp-${pkgver}.tar.bz2
srcdir=${location}/libXp-${pkgver}

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
