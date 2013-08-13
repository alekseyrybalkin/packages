#!/bin/sh

_pkgname=xmodmap
pkgname=xorg-${_pkgname}
vcs="git"
gittag=bf4620e2d78d2a4766948f136f2372a596ac275d
pkgver=1.0.7+
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
