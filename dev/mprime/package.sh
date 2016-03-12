#!/bin/sh

pkgname=mprime
pkgver=287
urls="http://www.mersenneforum.org/gimps/p95v${pkgver}.source.zip"
#srczip=p95v${pkgver}.source.zip
#srcdir=${location}/p95v${pkgver}

kiin_make() {
  mkdir mprime-${pkgver}
  cd mprime-${pkgver}
  unzip ${KIIN_HOME}/tarballs/p95v${pkgver}.source.zip || true
  patch -Np1 -i ../fix_makefile.patch
  cd gwnum
  make -f make64
  cd ../linux64
  make
}

kiin_install() {
  cd mprime-${pkgver}
  install -Dm755 linux64/mprime $pkgdir/usr/bin/mprime
  cd ../
  rm -rf mprime-${pkgver}
}
