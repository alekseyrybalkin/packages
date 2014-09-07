#!/bin/sh

pkgname=openal
pkgver=1.16.0
urls="http://kcat.strangesoft.net/openal-releases/${pkgname}-soft-${pkgver}.tar.bz2"
srctar=${pkgname}-soft-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-soft-${pkgver}

kiin_make() {
  cd build
  if [ -z "$KIIN_LIB32" ]; then
    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ..
  else
    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIB_SUFFIX=32 ..
  fi
  make
}

kiin_install() {
  make -C build DESTDIR=${pkgdir} install
}
