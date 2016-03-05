#!/bin/sh

pkgname=itstool
pkgver=2.0.2
urls="http://files.itstool.org/itstool/itstool-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/| python/&2/' configure.ac
  autoreconf -fi
  ./configure --prefix=/usr PYTHON=/usr/bin/python2
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
