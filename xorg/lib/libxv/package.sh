#!/bin/sh

pkgname=libxv
pkgver=1.0.7
urls="http://xorg.freedesktop.org/releases/individual/lib/libXv-${pkgver}.tar.bz2"
srctar=libXv-${pkgver}.tar.bz2
srcdir=${location}/libXv-${pkgver}

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
