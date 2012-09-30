#!/bin/sh

pkgname=rxvt-unicode
pkgver=9.15
urls="http://dist.schmorp.de/${pkgname}/Attic/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-everything
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
