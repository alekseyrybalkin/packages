#!/bin/sh

pkgname=libxfont
pkgver=1.4.5
urls="http://xorg.freedesktop.org/releases/individual/lib/libXfont-${pkgver}.tar.bz2"
srctar=libXfont-${pkgver}.tar.bz2
srcdir=${location}/libXfont-${pkgver}

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  ./configure $XORG_CONFIG --disable-devel-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
