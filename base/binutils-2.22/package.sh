#!/bin/sh

pkgname=binutils
pkgver=2.22
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  rm -fv etc/standards.info
  sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in
  patch -Np1 -i ../binutils-2.22-build_fix-1.patch
  mkdir -v binutils-build
  cd binutils-build
  ../configure --prefix=/usr --enable-shared
  make tooldir=${pkgdir}/usr
}

kiin_install() {
  cd binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
  cp -v ../include/libiberty.h ${pkgdir}/usr/include
}
