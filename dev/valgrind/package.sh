#!/bin/sh

pkgname=valgrind
pkgver=3.10.1
urls="http://valgrind.org/downloads/valgrind-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/valgrind-${pkgver}-glibc_2.21-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/valgrind-${pkgver}-glibc_2.21-1.patch
  sed -i 's/-mt//g' configure
  ./configure --prefix=/usr --datadir=/usr/share/doc/valgrind
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
