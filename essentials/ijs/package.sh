#!/bin/sh

pkgname=ijs
pkgver=0.35
urls="http://www.openprinting.org/download/ijs/download/ijs-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-shared \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
