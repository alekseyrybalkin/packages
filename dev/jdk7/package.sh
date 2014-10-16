#!/bin/sh

pkgname=jdk7
SKIP_ARCH_CHECK=1
pkgver=1.7.0_71
urls="somethere/jdk-7u71-linux-x64.tar.gz"
srctar=jdk-7u71-linux-x64.tar.gz
srcdir=${location}/jdk${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt/${pkgname}-${pkgver}
  cp -r ./* ${pkgdir}/opt/${pkgname}-${pkgver}
  ln -sv ${pkgname}-${pkgver} ${pkgdir}/opt/jdk
}
