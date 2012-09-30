#!/bin/sh

pkgname=libtiff
pkgver=4.0.2
urls="http://download.osgeo.org/${pkgname}/tiff-${pkgver}.tar.gz"
srctar=tiff-${pkgver}.tar.gz
srcdir=${location}/tiff-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
