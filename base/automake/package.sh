#!/bin/sh

pkgname=automake
pkgver=1.14
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --docdir=/usr/share/doc/${pkgname}-${pkgver}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
