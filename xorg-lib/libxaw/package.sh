#!/bin/sh

pkgname=libxaw
ARCH_NAME_LIB32=libxaw
pkgver=1.0.13
vcs=git
gittag=libXaw-${pkgver}
srcdir=${location}/libXaw-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
