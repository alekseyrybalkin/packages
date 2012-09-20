#!/bin/sh

pkgname=less
pkgver=444
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make prefix=${pkgdir}/usr install
}
