#!/bin/sh

pkgname=sed
pkgver=4.2.2
urls="http://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-${pkgver}
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html
}
