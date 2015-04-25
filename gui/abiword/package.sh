#!/bin/sh

pkgname=abiword
pkgver=3.0.1
urls="http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --without-evolution-data-server \
    --enable-plugins
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
