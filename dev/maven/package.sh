#!/bin/sh

pkgname=maven
pkgver=3.1.0
urls="http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${pkgver}/binaries/apache-maven-${pkgver}-bin.tar.gz \
  somethere/settings.xml.tar.gz"
srctar=apache-maven-${pkgver}-bin.tar.gz
srcdir=${location}/apache-maven-${pkgver}

kiin_make() {
  echo "nothing to make..."
  tar xvf ../settings.xml.tar.gz
  mv settings.xml conf
}

kiin_install() {
  mkdir -p ${pkgdir}/opt
  cp -r . ${pkgdir}/opt/maven
}
