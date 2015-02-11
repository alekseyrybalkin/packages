#!/bin/sh

KIIN_NO_STRIPPING=1
pkgname=wine
pkgver=1.7.36
urls="http://mirrors.ibiblio.org/wine/source/1.7/wine-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir ${location}/${pkgname}-32-build
  mkdir ${location}/${pkgname}-64-build

  cd ${location}/${pkgname}-64-build
  ../${pkgname}-${pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --without-gstreamer \
    --enable-win64
  make

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd ${location}/${pkgname}-32-build
  ../${pkgname}-${pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-x \
    --without-gstreamer \
    --with-wine64=${location}/${pkgname}-64-build
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2"
  unset PKG_CONFIG_PATH
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

kiin_after_install() {
  getent group arwen >/dev/null || groupadd arwen
  getent passwd arwen >/dev/null || \
    useradd -m -g arwen -G audio,video -s /bin/bash arwen
}

kiin_after_upgrade() {
  kiin_after_install
}
