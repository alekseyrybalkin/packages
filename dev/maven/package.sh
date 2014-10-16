#!/bin/sh

pkgname=maven
pkgver=3.2.3
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
