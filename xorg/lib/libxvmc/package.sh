#!/bin/sh

pkgname=libxvmc
pkgver=1.0.7
urls="http://xorg.freedesktop.org/releases/individual/lib/libXvMC-${pkgver}.tar.bz2"
srctar=libXvMC-${pkgver}.tar.bz2
srcdir=${location}/libXvMC-${pkgver}

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
