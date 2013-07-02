#!/bin/sh

pkgname=xz
pkgver=5.0.5
urls="http://tukaani.org/xz/xz-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=/lib --docdir=/usr/share/doc/xz-${pkgver}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} pkgconfigdir=/usr/lib/pkgconfig install
}
