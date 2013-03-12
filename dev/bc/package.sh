#!/bin/sh

pkgname=bc
pkgver=1.06.95
urls="http://alpha.gnu.org/gnu/bc/bc-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
