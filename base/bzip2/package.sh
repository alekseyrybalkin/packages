#!/bin/sh

#vcs=none
pkgname=bzip2
pkgver=1.0.6
urls="http://www.bzip.org/${pkgver}/bzip2-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../bzip2-install_docs.patch
  sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
  sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
  make -f Makefile-libbz2_so
  make clean
  make
}

kiin_install() {
  mkdir ${pkgdir}/usr
  make PREFIX=${pkgdir}/usr install
  rm -v ${pkgdir}/usr/bin/{bunzip2,bzcat,bzip2}
  cp -v bzip2-shared ${pkgdir}/usr/bin/bzip2
  ln -sv bzip2 ${pkgdir}/usr/bin/bunzip2
  ln -sv bzip2 ${pkgdir}/usr/bin/bzcat
  cp -av libbz2.so* ${pkgdir}/usr/lib
  ln -sv libbz2.so.1.0 ${pkgdir}/usr/lib/libbz2.so
}
