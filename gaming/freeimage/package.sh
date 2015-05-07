#!/bin/sh

pkgname=freeimage
pkgver=3.17.0
urls="http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip"
srczip=FreeImage${pkgver//./}.zip
srcdir=${location}/FreeImage

kiin_make() {
  cp -r ../FreeImage ../FreeImagefip

  export CFLAGS+=" -O3 -fPIC -fexceptions -fvisibility=hidden -DNO_LCMS -std=gnu89"
  export CXXFLAGS+=" -O3 -fPIC -fexceptions -fvisibility=hidden -Wno-ctor-dtor-privacy"

  make

  cd ../FreeImagefip
  make -f Makefile.fip
}

kiin_install() {
  make DESTDIR=${pkgdir} install

  cd ../FreeImagefip
  make -f Makefile.fip DESTDIR=${pkgdir} install
  cd ../
  rm -rf FreeImagefip
}
