#!/bin/sh

pkgname=mpg123
pkgver=1.14.4
urls="http://downloads.sourceforge.net/mpg123/mpg123-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
