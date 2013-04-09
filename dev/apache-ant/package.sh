#!/bin/sh

pkgname=apache-ant
pkgver=1.8.4
urls="http://archive.apache.org/dist/ant/source/apache-ant-${pkgver}-src.tar.bz2"
srctar=${pkgname}-${pkgver}-src.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's;jars,test-jar;jars;' build.xml
}

kiin_install() {
  export JAVA_HOME=/opt/jdk
  ./build.sh -Ddist.dir=${pkgdir}/opt/ant-1.8.4 dist
  ln -v -sfn ant-1.8.4 ${pkgdir}/opt/ant
}
