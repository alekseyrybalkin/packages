#!/bin/sh

pkgname=xf86-video-intel
pkgver=2.99.912
urls="http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
