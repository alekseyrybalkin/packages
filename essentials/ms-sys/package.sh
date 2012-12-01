#!/bin/sh

pkgname=ms-sys
pkgver=2.2.1
urls="http://prdownloads.sourceforge.net/ms-sys/ms-sys-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make PREFIX=${pkgdir}/usr
}

kiin_install() {
  make PREFIX=${pkgdir}/usr install
}
