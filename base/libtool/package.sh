#!/bin/sh

pkgname=libtool
pkgver=2.4.2
urls="http://ftp.gnu.org/gnu/libtool/libtool-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
