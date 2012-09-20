#!/bin/sh

pkgname=sed
pkgver=4.2.1
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../sed-4.2.1-testsuite_fixes-1.patch
  ./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.1
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html
}
