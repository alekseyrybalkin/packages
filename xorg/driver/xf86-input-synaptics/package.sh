#!/bin/sh

pkgname=xf86-input-synaptics
pkgver=1.7.3
urls="http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
