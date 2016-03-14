#!/bin/sh

pkgname=iw
pkgver=4.3
urls="https://www.kernel.org/pub/software/network/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} SBINDIR=/usr/bin install
}
