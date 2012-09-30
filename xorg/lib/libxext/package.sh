#!/bin/sh

pkgname=libxext
pkgver=1.3.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXext-${pkgver}.tar.bz2"
srctar=libXext-${pkgver}.tar.bz2
srcdir=${location}/libXext-${pkgver}

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
