#!/bin/sh

pkgname=bzip2
pkgver=1.0.6
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -n "$KIIN_LIB32" ]; then
    sed -i "s|CC=gcc|CC=gcc -m32|" Makefile
    sed -i "s|CC=gcc|CC=gcc -m32|" Makefile-libbz2_so
  fi
  patch -Np1 -i ../bzip2-1.0.6-install_docs-1.patch
  sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
  sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
  make -f Makefile-libbz2_so
  make clean
  if [ -z "$KIIN_LIB32" ]; then
    make
  else
    make libbz2.a
  fi
}

kiin_install() {
  if [ -z "$KIIN_LIB32" ]; then
    mkdir ${pkgdir}/{usr,bin,lib}
    make PREFIX=${pkgdir}/usr install
    cp -v bzip2-shared ${pkgdir}/bin/bzip2
    cp -av libbz2.so* ${pkgdir}/lib
    ln -sv ../../lib/libbz2.so.1.0 ${pkgdir}/usr/lib/libbz2.so
    rm -v ${pkgdir}/usr/bin/{bunzip2,bzcat,bzip2}
    ln -sv bzip2 ${pkgdir}/bin/bunzip2
    ln -sv bzip2 ${pkgdir}/bin/bzcat
  else
    install -Dm755 libbz2.so.1.0.6 ${pkgdir}/usr/lib32/libbz2.so.1.0.6
    ln -s libbz2.so.1.0.6 ${pkgdir}/usr/lib32/libbz2.so
    ln -s libbz2.so.1.0.6 ${pkgdir}/usr/lib32/libbz2.so.1
    ln -s libbz2.so.1.0.6 ${pkgdir}/usr/lib32/libbz2.so.1.0
    install -Dm644 libbz2.a ${pkgdir}/usr/lib32/libbz2.a
  fi
}
