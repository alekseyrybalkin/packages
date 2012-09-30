#!/bin/sh

pkgname=libxfixes
pkgver=5.0
urls="http://xorg.freedesktop.org/releases/individual/lib/libXfixes-${pkgver}.tar.bz2"
srctar=libXfixes-${pkgver}.tar.bz2
srcdir=${location}/libXfixes-${pkgver}

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
