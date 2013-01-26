#!/bin/sh

pkgname=libffi
pkgver=3.0.11
urls="ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/libffi-${pkgver}-includedir-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../libffi-${pkgver}-includedir-1.patch
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
