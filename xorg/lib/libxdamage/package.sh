#!/bin/sh

pkgname=libxdamage
pkgver=1.1.3
urls="http://xorg.freedesktop.org/releases/individual/lib/libXdamage-${pkgver}.tar.bz2"
srctar=libXdamage-${pkgver}.tar.bz2
srcdir=${location}/libXdamage-${pkgver}

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
