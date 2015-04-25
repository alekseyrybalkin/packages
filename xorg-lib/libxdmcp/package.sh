#!/bin/sh

pkgname=libxdmcp
pkgver=1.1.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXdmcp-${pkgver}.tar.bz2"
srctar=libXdmcp-${pkgver}.tar.bz2
srcdir=${location}/libXdmcp-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
