#!/bin/sh

pkgname=jsoncpp
pkgver=1.4.4
urls="https://github.com/open-source-parsers/${pkgname}/archive/${pkgver}.tar.gz"
srctar=${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DJSONCPP_LIB_BUILD_SHARED=ON \
    -DJSONCPP_WITH_TESTS=OFF
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
}
