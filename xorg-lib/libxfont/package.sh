#!/bin/sh

pkgname=libxfont
pkgver=2.0.1
vcs=git
gittag=libXfont2-${pkgver}
srcdir=${location}/libXfont2-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG --disable-devel-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
