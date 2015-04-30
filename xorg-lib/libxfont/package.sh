#!/bin/sh

pkgname=libxfont
pkgver=1.5.1
vcs=git
gittag=libXfont-${pkgver}
srcdir=${location}/libXfont-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --disable-devel-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
