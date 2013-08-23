#!/bin/sh

pkgname=check
pkgver=0.9.10
urls="http://sourceforge.net/projects/check/files/check/${pkgver}/check-${pkgver}.tar.gz"
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
