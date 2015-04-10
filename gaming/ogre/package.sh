#!/bin/sh

pkgname=ogre
pkgver=1.9.0
vcs=mercurial
hgtag=v${pkgver//./-}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 < ../cmake30.patch

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
