#!/bin/sh

pkgname=freeglut
pkgver=2.8.1
urls="http://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
