#!/bin/sh

pkgname=glu
pkgver=9.0.0
urls="ftp://ftp.freedesktop.org/pub/mesa/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

XORG_PREFIX="/usr"

kiin_make() {
  ./configure --prefix=$XORG_PREFIX \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
