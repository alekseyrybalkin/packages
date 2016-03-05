#!/bin/sh

pkgname=tidy-html5
pkgver=5.1.25
vcs=git
gittag=${pkgver}
srcdir=${location}/tidy-html5-${pkgver}

kiin_make() {
  cd build/cmake
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TAB2SPACE=ON \
    ../..
  make
}

kiin_install() {
  cd build/cmake
  make DESTDIR=${pkgdir} install
  install -v -m755 tab2space ${pkgdir}/usr/bin
}
