#!/bin/sh

KIIN_NON_FREE=1 # because binary
pkgname=maven
pkgver=3.3.3
urls="http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${pkgver}/binaries/apache-maven-${pkgver}-bin.tar.gz"
srctar=apache-maven-${pkgver}-bin.tar.gz
srcdir=${location}/apache-maven-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/opt
  cp -r . ${pkgdir}/opt/maven

  chmod o-rwx,g-w ${pkgdir}/opt/maven/bin/*
  chown root:javer ${pkgdir}/opt/maven/bin/*
}
