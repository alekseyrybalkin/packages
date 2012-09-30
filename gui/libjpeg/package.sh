#!/bin/sh

pkgname=libjpeg
pkgver=8d
urls="http://www.ijg.org/files/jpegsrc.v${pkgver}.tar.gz"
srctar=jpegsrc.v${pkgver}.tar.gz
srcdir=${location}/jpeg-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
