#!/bin/sh

pkgname=patch
pkgver=2.7
urls="http://ftp.gnu.org/gnu/patch/patch-2.7.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
