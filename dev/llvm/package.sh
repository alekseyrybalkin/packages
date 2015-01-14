#!/bin/sh

pkgname=llvm
pkgver=3.5.1
urls="http://llvm.org/releases/${pkgver}/llvm-${pkgver}.src.tar.xz"
srctar=${pkgname}-${pkgver}.src.tar.xz
srcdir=${location}/${pkgname}-${pkgver}.src

kiin_make() {
  CC=gcc CXX=g++ \
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-libffi \
    --enable-optimized \
    --enable-shared \
    --disable-assertions
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  for file in ${pkgdir}/usr/lib/lib{clang,LLVM,LTO}*.a; do
    test -f $file && chmod -v 644 $file
  done
  rm -rf ${pkgdir}/usr/docs
}
