#!/bin/sh

pkgname=libxrender
pkgver=0.9.7
urls="http://xorg.freedesktop.org/releases/individual/lib/libXrender-${pkgver}.tar.bz2"
srctar=libXrender-${pkgver}.tar.bz2
srcdir=${location}/libXrender-${pkgver}

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
