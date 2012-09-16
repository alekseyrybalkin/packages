#!/bin/sh

pkgname=man-pages
pkgver=3.42
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  make prefix=${pkgdir}/usr install
}
