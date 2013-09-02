#!/bin/sh

pkgname=jdk7
pkgver=1.7.0_25
urls="somethere/jdk-7u25-linux-x64.tar.gz"
srctar=jdk-7u25-linux-x64.tar.gz
srcdir=${location}/jdk${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt/${pkgname}-${pkgver}
  cp -r ./* ${pkgdir}/opt/${pkgname}-${pkgver}
}
