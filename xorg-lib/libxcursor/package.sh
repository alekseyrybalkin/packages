#!/bin/sh

pkgname=libxcursor
pkgver=1.1.14
vcs=git
gittag=libXcursor-${pkgver}
srcdir=${location}/libXcursor-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
