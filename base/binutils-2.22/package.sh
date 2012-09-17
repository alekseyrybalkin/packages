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
  mv -v ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
  rm -r ${pkgdir}/usr/lib64
  ln -sv lib ${pkgdir}/usr/lib64
  cp -v ../include/libiberty.h ${pkgdir}/usr/include
}
