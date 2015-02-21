#!/bin/sh

pkgname=mpc
ARCH_NAME=libmpc
pkgver=1.0.3
urls="http://www.multiprecision.org/${pkgname}/download/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
