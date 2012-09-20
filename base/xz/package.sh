#!/bin/sh

pkgname=xz
pkgver=5.0.4
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=/lib --docdir=/usr/share/doc/xz-5.0.4
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} pkgconfigdir=/usr/lib/pkgconfig install
}
