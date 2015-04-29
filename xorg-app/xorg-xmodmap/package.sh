#!/bin/sh

_pkgname=xmodmap
pkgname=xorg-${_pkgname}
pkgver=1.0.9
vcs="git"
gittag=xmodmap-${pkgver}
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  NOCONFIGURE=1 ./autogen.sh
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
