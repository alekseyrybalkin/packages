#!/bin/sh

pkgname=icedtea-web
pkgver=1.4
urls="http://icedtea.classpath.org/download/source/icedtea-web-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

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
