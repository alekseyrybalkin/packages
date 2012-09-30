#!/bin/sh

pkgname=libxaw
pkgver=1.0.11
urls="http://xorg.freedesktop.org/releases/individual/lib/libXaw-${pkgver}.tar.bz2"
srctar=libXaw-${pkgver}.tar.bz2
srcdir=${location}/libXaw-${pkgver}

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
