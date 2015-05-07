#!/bin/sh

pkgname=ogre
pkgver=1.9.0+
vcs=mercurial
hgtag=55e89ae88219
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
}
