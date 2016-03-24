#!/bin/sh

_pkgname=xrdb
pkgname=xorg-${_pkgname}
pkgver=1.1.0
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
