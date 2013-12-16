#!/bin/sh

pkgname=libdvdcss
pkgver=1.2.13
urls="http://download.videolan.org/pub/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
