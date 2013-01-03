#!/bin/sh

_pkgname=xsetroot
pkgname=xorg-${_pkgname}
pkgver=1.1.0
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
