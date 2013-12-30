#!/bin/sh

pkgname=libmemcached
pkgver=1.0.17
urls="http://launchpad.net/${pkgname}/1.0/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz \
  http://rybalkin.org/kiin-files/libmemcached-gcc-4.8.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # Fix build with GCC 4.8 (patch from Debian)
  patch -Np1 -i ${KIIN_HOME}/tarballs/libmemcached-gcc-4.8.patch
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
