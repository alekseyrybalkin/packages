#!/bin/sh

pkgname=binutils
pkgver=2.23
urls="http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}
multilib=1

kiin_make() {
  rm -fv etc/standards.info
  sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in
  mkdir -v binutils-build
  cd binutils-build
  ../configure --prefix=/usr --enable-shared --enable-multilib
  make tooldir=${pkgdir}/usr
}

kiin_install() {
  cd binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
  cp -v ../include/libiberty.h ${pkgdir}/usr/include
}
