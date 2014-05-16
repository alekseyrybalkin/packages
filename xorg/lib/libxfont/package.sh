#!/bin/sh

pkgname=libxfont
vcs="git"
pkgver=1.4.8+
gittag=master
srcdir=${location}/libXfont-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure $XORG_CONFIG --disable-devel-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
