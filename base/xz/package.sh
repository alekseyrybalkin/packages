#!/bin/sh

pkgname=xz
pkgver=5.0.6
urls="http://tukaani.org/xz/xz-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/xz \
    --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
