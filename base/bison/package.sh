#!/bin/sh

pkgname=bison
pkgver=2.6.4
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
