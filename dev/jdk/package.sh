#!/bin/sh

pkgname=jdk
SKIP_ARCH_CHECK=1
pkgver=1.6.0_45
urls="somethere/${pkgname}${pkgver}.tar.gz"
srctar=${pkgname}${pkgver}.tar.gz
srcdir=${location}/${pkgname}${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt/${pkgname}-${pkgver}
  cp -r ./* ${pkgdir}/opt/${pkgname}-${pkgver}
}
