#!/bin/sh

_pkgname=xrandr
pkgname=xorg-${_pkgname}
pkgver=1.4.3
vcs=git
gittag=${_pkgname}-${pkgver}
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
