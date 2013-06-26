#!/bin/sh

pkgname=icedtea-web
pkgver=1.4
extension=gz
folder="http://icedtea.wildebeest.org/download/source/"
check_server=1

. ${KIIN_HOME}/defaults.sh

ver_grep="^${pkgname}-[^-pre]*\.tar\.${extension}$"

kiin_make() {
  ./configure --prefix=`readlink -f ${JAVA_HOME}`/jre \
    --with-jdk-home=`readlink -f ${JAVA_HOME}` \
    --disable-docs \
    --mandir=`readlink -f ${JAVA_HOME}`/man
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}
