#!/bin/sh

pkgname=automake
pkgver=1.12.3
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.12.3
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
