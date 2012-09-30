#!/bin/sh

pkgname=libxmu
pkgver=1.1.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXmu-${pkgver}.tar.bz2"
srctar=libXmu-${pkgver}.tar.bz2
srcdir=${location}/libXmu-${pkgver}

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
