#!/bin/sh

pkgname=libice
pkgver=1.0.9
vcs=git
gittag=libICE-${pkgver}
srcdir=${location}/libICE-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
