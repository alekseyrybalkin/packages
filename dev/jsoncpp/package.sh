#!/bin/sh

pkgname=jsoncpp
pkgver=1.6.5
urls="https://github.com/open-source-parsers/${pkgname}/archive/${pkgver}.tar.gz"
wget_set_filename=${pkgname}-${pkgver}.tar.gz
srctar=${pkgname}-${pkgver}.tar.gz
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
