#!/bin/sh

pkgname=grep
pkgver=2.14
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --bindir=/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
