#!/bin/sh

KIIN_NON_FREE=1
pkgname=jdk
SKIP_ARCH_CHECK=1
pkgver=1.7.0_75
urls="somethere/jdk-7u75-linux-x64.tar.gz"
srctar=jdk-7u75-linux-x64.tar.gz
srcdir=${location}/jdk${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt/jdk
  cp -r ./* ${pkgdir}/opt/jdk

  chmod o-rwx,g-w ${pkgdir}/opt/jdk/{,jre/,db/}bin/*
  chown root:javer ${pkgdir}/opt/jdk/{,jre/,db/}bin/*
}
