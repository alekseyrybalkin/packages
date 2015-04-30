#!/bin/sh

pkgname=libxpm
ARCH_NAME_LIB32=libxpm
pkgver=3.5.11
vcs=git
gittag=libXpm-${pkgver}
srcdir=${location}/libXpm-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
