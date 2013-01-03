#!/bin/sh

pkgname=libxt
pkgver=1.1.3
urls="http://xorg.freedesktop.org/releases/individual/lib/libXt-${pkgver}.tar.bz2"
srctar=libXt-${pkgver}.tar.bz2
srcdir=${location}/libXt-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG \
    --with-appdefaultdir=/etc/X11/app-defaults \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
