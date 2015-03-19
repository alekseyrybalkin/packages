#!/bin/sh

KIIN_NON_FREE=1
pkgname=maven
pkgver=3.3.1
urls="http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${pkgver}/binaries/apache-maven-${pkgver}-bin.tar.gz"
srctar=apache-maven-${pkgver}-bin.tar.gz
srcdir=${location}/apache-maven-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt
  cp -r . ${pkgdir}/opt/maven
}

kiin_after_install() {
  chmod go-rwx /opt/maven/bin/*
  getent group javer >/dev/null || groupadd javer
  getent passwd javer >/dev/null || \
    useradd -m -g javer -s /bin/bash javer
  chown javer:javer /opt/maven/bin/*
}

kiin_after_upgrade() {
  kiin_after_install
}
