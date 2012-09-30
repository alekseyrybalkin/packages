#!/bin/sh

pkgname=libxpm
pkgver=3.5.10
urls="http://xorg.freedesktop.org/releases/individual/lib/libXpm-${pkgver}.tar.bz2"
srctar=libXpm-${pkgver}.tar.bz2
srcdir=${location}/libXpm-${pkgver}

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
