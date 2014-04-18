#!/bin/sh

pkgname=libxfont
vcs="git"
gittag=master
pkgver=1.4.7+
srcdir=${location}/libXfont-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure $XORG_CONFIG --disable-devel-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
