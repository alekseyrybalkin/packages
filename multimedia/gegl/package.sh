#!/bin/sh

pkgname=gegl
ARCH_NAME=gegl02
pkgver=0.2.0
urls="http://gd.tuwien.ac.at/graphics/gimp/gegl/0.2/gegl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
