#!/bin/sh

pkgname=apache-ant
pkgver=1.9.0
urls="http://archive.apache.org/dist/ant/source/apache-ant-${pkgver}-src.tar.bz2"
srctar=${pkgname}-${pkgver}-src.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's;jars,test-jar;jars;' build.xml
}

kiin_install() {
  export JAVA_HOME=/opt/jdk
  unset _JAVA_OPTIONS
  ./build.sh -Ddist.dir=${pkgdir}/opt/ant-${pkgver} dist
  ln -v -sfn ant-${pkgver} ${pkgdir}/opt/ant
}
