#!/bin/sh

pkgname=libxt
pkgver=1.1.3
urls="http://xorg.freedesktop.org/releases/individual/lib/libXt-${pkgver}.tar.bz2"
srctar=libXt-${pkgver}.tar.bz2
srcdir=${location}/libXt-${pkgver}

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  ./configure $XORG_CONFIG \
    --with-appdefaultdir=/etc/X11/app-defaults
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
