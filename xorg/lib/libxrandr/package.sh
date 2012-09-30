#!/bin/sh

pkgname=libxrandr
pkgver=1.4.0
urls="http://xorg.freedesktop.org/releases/individual/lib/libXrandr-${pkgver}.tar.bz2"
srctar=libXrandr-${pkgver}.tar.bz2
srcdir=${location}/libXrandr-${pkgver}

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
