#!/bin/sh

pkgname=libxdmcp
pkgver=1.1.2
vcs=git
gittag=libXdmcp-${pkgver}
srcdir=${location}/libXdmcp-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
