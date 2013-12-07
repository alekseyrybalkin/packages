#!/bin/sh

pkgname=glfw
pkgver=3.0.3
urls="http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
}
