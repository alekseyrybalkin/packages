#!/bin/sh

pkgname=xorg-util-macros
pkgver=1.17
urls="http://xorg.freedesktop.org/releases/individual/util/util-macros-${pkgver}.tar.bz2"
srctar=util-macros-${pkgver}.tar.bz2
srcdir=${location}/util-macros-${pkgver}

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
