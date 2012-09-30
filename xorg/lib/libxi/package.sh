#!/bin/sh

pkgname=libxi
pkgver=1.6.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXi-${pkgver}.tar.bz2"
srctar=libXi-${pkgver}.tar.bz2
srcdir=${location}/libXi-${pkgver}

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
