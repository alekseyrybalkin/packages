#!/bin/sh

pkgname=valgrind
pkgver=3.10.1
urls="http://valgrind.org/downloads/valgrind-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../valgrind-${pkgver}-glibc_2.21-1.patch
  sed -i 's/-mt//g' configure
  # Linux 4.0 fix
  sed -i -e "s/2\.6\.\*|3\.\*)/2\.6\.\*|3\.\*|4\.\*)/g" configure
  ./configure --prefix=/usr --datadir=/usr/share/doc/valgrind
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
