#!/bin/sh

KIIN_NON_FREE=1
pkgname=jdk
SKIP_ARCH_CHECK=1
pkgver=1.8.0_73
urls="somethere/jdk-8u73-linux-x64.tar.gz"
srctar=jdk-8u73-linux-x64.tar.gz
srcdir=${location}/jdk${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt/jdk
  cp -r ./* ${pkgdir}/opt/jdk
}
