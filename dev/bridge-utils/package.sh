#!/bin/sh

pkgname=bridge-utils
pkgver=1.5
urls="http://sourceforge.net/projects/bridge/files/bridge/bridge-utils-${pkgver}.tar.gz \
   http://www.linuxfromscratch.org/patches/blfs/svn/bridge-utils-${pkgver}-linux_3.8_fix-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../bridge-utils-${pkgver}-linux_3.8_fix-1.patch
  autoconf -o configure configure.in
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
