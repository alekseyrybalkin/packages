#!/bin/sh

pkgname=apache-ant
pkgver=1.9.2
extension=bz2
folder="http://archive.apache.org/dist/ant/source/"
check_server=1

srctar=${pkgname}-${pkgver}-src.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-.*-src\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}-//g" | sed -r "s/-src\.tar\.${extension}$//g"
}

kiin_make() {
  sed -i 's;jars,test-jar;jars;' build.xml
}

kiin_install() {
  export JAVA_HOME=`find /opt -maxdepth 1 -name "openjdk-*" | sort | head -n 1`
  unset _JAVA_OPTIONS
  unset J2SDKDIR
  unset J2REDIR
  ./build.sh -Ddist.dir=${pkgdir}/opt/ant-${pkgver} dist
  ln -v -sfn ant-${pkgver} ${pkgdir}/opt/ant
}
