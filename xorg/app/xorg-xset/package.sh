#!/bin/sh

_pkgname=xset
pkgname=xorg-${_pkgname}
pkgver=1.2.3
urls="http://xorg.freedesktop.org/releases/individual/app/${_pkgname}-${pkgver}.tar.bz2"
srctar=${_pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
