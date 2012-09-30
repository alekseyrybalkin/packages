#!/bin/sh

pkgname=libxxf86vm
pkgver=1.1.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXxf86vm-${pkgver}.tar.bz2"
srctar=libXxf86vm-${pkgver}.tar.bz2
srcdir=${location}/libXxf86vm-${pkgver}

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
