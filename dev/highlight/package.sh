#!/bin/sh

pkgname=highlight
pkgver=3.15
urls="http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
