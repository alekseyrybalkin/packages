#!/bin/sh

pkgname=stuntrally
pkgver=2.5
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DSHARE_INSTALL="share/stuntrally"
  make

  cd ../
  git clone ${SOURCES_HOME}/stuntrally-tracks
  cd stuntrally-tracks
  git checkout ${pkgver}

  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install

  cd ../stuntrally-tracks/build
  make DESTDIR=${pkgdir}/usr/share/stuntrally/ install

  rm "${pkgdir}/usr/share/stuntrally/objects0/_readme 0 A.D.txt"
}
