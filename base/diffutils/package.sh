#!/bin/sh

pkgname=diffutils
pkgver=3.2
urls="http://ftp.gnu.org/gnu/diffutils/diffutils-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' lib/stdio.in.h
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
