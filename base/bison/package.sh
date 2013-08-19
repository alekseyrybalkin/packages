#!/bin/sh

pkgname=bison
pkgver=3.0
urls="http://ftp.gnu.org/gnu/bison/bison-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
