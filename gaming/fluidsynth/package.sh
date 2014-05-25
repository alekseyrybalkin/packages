#!/bin/sh

pkgname=fluidsynth
pkgver=1.1.6
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_SUFFIX=""
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
