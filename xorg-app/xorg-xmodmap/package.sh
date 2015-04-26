#!/bin/sh

_pkgname=xmodmap
pkgname=xorg-${_pkgname}
vcs="git"
gittag=xmodmap-1.0.9
pkgver=1.0.9
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}