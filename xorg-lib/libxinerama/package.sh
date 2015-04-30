#!/bin/sh

pkgname=libxinerama
pkgver=1.1.3
vcs=git
gittag=libXinerama-${pkgver}
srcdir=${location}/libXinerama-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
