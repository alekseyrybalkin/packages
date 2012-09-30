#!/bin/sh

pkgname=libxdmcp
pkgver=1.1.1
urls="http://xorg.freedesktop.org/releases/individual/lib/libXdmcp-${pkgver}.tar.bz2"
srctar=libXdmcp-${pkgver}.tar.bz2
srcdir=${location}/libXdmcp-${pkgver}

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
