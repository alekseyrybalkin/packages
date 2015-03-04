#!/bin/sh

pkgname=grep
pkgver=2.21
urls="http://ftp.gnu.org/gnu/grep/grep-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/tp++/a  if (ep <= tp) break;' src/kwset.c
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
