#!/bin/sh

pkgname=make
pkgver=3.82
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/lfs/development/${pkgname}-${pkgver}-upstream_fixes-3.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../make-3.82-upstream_fixes-3.patch
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
