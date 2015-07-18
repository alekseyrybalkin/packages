#!/bin/sh

pkgname=xz
pkgver=5.2.1
urls="http://tukaani.org/xz/xz-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/xz
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
