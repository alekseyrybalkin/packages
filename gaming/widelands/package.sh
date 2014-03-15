#!/bin/sh

pkgname=widelands
pkgver=18
urls="https://launchpad.net/widelands/build${pkgver}/build-${pkgver}/+download/${pkgname}-build${pkgver}-src.tar.bz2"
srctar=${pkgname}-build${pkgver}-src.tar.bz2
srcdir=${location}/${pkgname}-build${pkgver}-src

kiin_make() {
  mkdir -p build/compile && cd build/compile
  cmake ../.. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWL_INSTALL_PREFIX=/usr \
    -DWL_INSTALL_DATADIR=share/${pkgname} \
    -DWL_INSTALL_BINDIR=bin
  make
}

kiin_install() {
  cd build/compile
  make DESTDIR=${pkgdir} install
}
