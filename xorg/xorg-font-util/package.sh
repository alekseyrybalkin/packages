#!/bin/sh

_pkgname=font-util
pkgname=xorg-${_pkgname}
pkgver=1.3.1
urls="http://xorg.freedesktop.org/releases/individual/font/${_pkgname}-${pkgver}.tar.bz2"
srctar=${_pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}