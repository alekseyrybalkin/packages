#!/bin/sh

pkgname=nasm
pkgver=2.11.02
urls="http://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/nasm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make INSTALLROOT=${pkgdir} install
}
