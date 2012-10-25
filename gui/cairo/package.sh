#!/bin/sh

pkgname=cairo
pkgver=1.12.6
urls="http://cairographics.org/releases/${pkgname}-${pkgver}.tar.xz \
  http://www.linuxfromscratch.org/patches/blfs/svn/${pkgname}-1.12.4-expose_snapshot-1.patch"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../${pkgname}-1.12.4-expose_snapshot-1.patch
  ./configure --prefix=/usr --disable-static --enable-tee --enable-xcb
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
