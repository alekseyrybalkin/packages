#!/bin/sh

pkgname=libxtst
pkgver=1.2.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXtst-${pkgver}.tar.bz2"
srctar=libXtst-${pkgver}.tar.bz2
srcdir=${location}/libXtst-${pkgver}

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
