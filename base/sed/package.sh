#!/bin/sh

pkgname=sed
pkgver=4.2.1
urls="http://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.bz2 \
   http://www.linuxfromscratch.org/patches/lfs/development/sed-${pkgver}-testsuite_fixes-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../sed-${pkgver}-testsuite_fixes-1.patch
  ./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-${pkgver}
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html
}
