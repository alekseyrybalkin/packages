#!/bin/sh

pkgname=autoconf
pkgver=2.69
urls="http://ftp.gnu.org/gnu/autoconf/autoconf-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
