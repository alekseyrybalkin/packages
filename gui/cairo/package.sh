#!/bin/sh

pkgname=cairo
pkgver=1.12.2
urls="http://cairographics.org/releases/${pkgname}-${pkgver}.tar.xz \
  http://www.linuxfromscratch.org/patches/blfs/svn/${pkgname}-${pkgver}-expose-snapshot-1.patch"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's#check-plt,sh ##' src/Makefile.in
  patch -p1 < ../${pkgname}-${pkgver}-expose-snapshot-1.patch
  ./configure --prefix=/usr --disable-static --enable-tee --enable-xcb
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
