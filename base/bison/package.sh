#!/bin/sh

pkgname=bison
pkgver=2.6.2
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  echo '#define YYENABLE_NLS 1' >> lib/config.h
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
