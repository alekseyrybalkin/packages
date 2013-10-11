#!/bin/sh

pkgname=wine
pkgver=1.7.4
_pkgver=1.7.4
urls="http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${_pkgver}.tar.bz2"
srctar=${pkgname}-${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${_pkgver}

kiin_make() {
  mkdir ${location}/${pkgname}-32-build
  mkdir ${location}/${pkgname}-64-build

  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="${CXXFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  cd ${location}/${pkgname}-64-build
  ../${pkgname}-${_pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --without-gstreamer \
    --enable-win64
  make CFLAGS+="-fno-builtin-memcpy" CXXFLAGS+="-fno-builtin-memcpy"

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd ${location}/${pkgname}-32-build
  ../${pkgname}-${_pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-x \
    --without-gstreamer \
    --with-wine64=${location}/${pkgname}-64-build
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
}

kiin_install() {
  cd ../${pkgname}-32-build
  make prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib32" \
    dlldir="${pkgdir}/usr/lib32/wine" install

  cd ../${pkgname}-64-build
  make prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib" \
    dlldir="${pkgdir}/usr/lib/wine" install

  cd ..
  rm -rf ${pkgname}-32-build
  rm -rf ${pkgname}-64-build
}
