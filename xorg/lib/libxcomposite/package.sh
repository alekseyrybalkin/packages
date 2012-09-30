#!/bin/sh

pkgname=libxcomposite
pkgver=0.4.3
urls="http://xorg.freedesktop.org/releases/individual/lib/libXcomposite-${pkgver}.tar.bz2"
srctar=libXcomposite-${pkgver}.tar.bz2
srcdir=${location}/libXcomposite-${pkgver}

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
