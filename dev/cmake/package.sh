#!/bin/sh

pkgname=cmake
pkgver=2.8.11
urls="http://www.cmake.org/files/v2.8/cmake-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --docdir=/share/doc/cmake-${pkgver} \
    --no-system-libarchive
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
