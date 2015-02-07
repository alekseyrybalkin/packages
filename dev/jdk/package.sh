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
}

kiin_after_install() {
  chmod go-rwx /opt/jdk/{,jre/,db/}bin/*
  getent group javer >/dev/null || groupadd javer
  getent passwd javer >/dev/null || \
    useradd -m -g javer -s /bin/bash javer
  chown javer:javer /opt/jdk/{,jre/,db/}bin/*
}

kiin_after_upgrade() {
  kiin_after_install
}
