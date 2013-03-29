#!/bin/sh

pkgname=diffutils
pkgver=3.3
urls="http://ftp.gnu.org/gnu/diffutils/diffutils-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
