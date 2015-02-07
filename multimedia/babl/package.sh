#!/bin/sh

pkgname=babl
pkgver=0.1.12
urls="http://download.gimp.org/pub/babl/0.1/babl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
