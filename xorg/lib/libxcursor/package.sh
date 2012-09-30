#!/bin/sh

pkgname=libxcursor
pkgver=1.1.13
urls="http://xorg.freedesktop.org/releases/individual/lib/libXcursor-${pkgver}.tar.bz2"
srctar=libXcursor-${pkgver}.tar.bz2
srcdir=${location}/libXcursor-${pkgver}

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
