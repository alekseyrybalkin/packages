#!/bin/sh

_pkgname=xmodmap
pkgname=xorg-${_pkgname}
vcs="git"
gittag=f784ef30fdbd1b32aacf44537d9e7c85d268465b
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
