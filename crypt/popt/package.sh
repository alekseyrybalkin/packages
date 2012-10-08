#!/bin/sh

pkgname=popt
pkgver=1.16
urls="ftp://anduin.linuxfromscratch.org/BLFS/svn/p/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
