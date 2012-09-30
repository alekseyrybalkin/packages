#!/bin/sh

pkgname=libdrm
pkgver=2.4.39
urls="http://dri.freedesktop.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

XORG_PREFIX="/usr"

kiin_make() {
  ./configure --prefix=$XORG_PREFIX \
    --enable-udev \
    --enable-vmwgfx-experimental-api \
    --enable-nouveau-experimental-api
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
