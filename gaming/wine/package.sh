#!/bin/sh

pkgname=wine
pkgver=1.7.32
_pkgver=1.7.32
urls="http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${_pkgver}.tar.bz2"
srctar=${pkgname}-${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${_pkgver}

kiin_make() {
  # ncurses fix
  sed -i 's|libncurses|libncursesw|g' configure
  sed -i 's|lncurses|lncursesw|g' configure

  mkdir ${location}/${pkgname}-32-build
  mkdir ${location}/${pkgname}-64-build

  export CFLAGS="-march=native -O0 -pipe -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="-march=native -O0 -pipe -D_FORTIFY_SOURCE=0"

  cd ${location}/${pkgname}-64-build
  ../${pkgname}-${_pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --without-gstreamer \
    --without-opencl \
    --without-hal \
    --without-sane \
    --without-v4l \
    --without-gphoto \
    --without-oss \
    --without-capi \
    --without-cups \
    --without-gsm \
    --without-ldap \
    --enable-win64
  make

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd ${location}/${pkgname}-32-build
  ../${pkgname}-${_pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-x \
    --without-gstreamer \
    --without-opencl \
    --without-hal \
    --without-sane \
    --without-v4l \
    --without-gphoto \
    --without-oss \
    --without-capi \
    --without-cups \
    --without-gsm \
    --without-ldap \
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

kiin_after_install() {
  getent group gamer >/dev/null || groupadd gamer
  getent passwd gamer >/dev/null || \
    useradd -m -g gamer -G audio,video -s /bin/bash gamer
}

kiin_after_upgrade() {
  kiin_after_install
}
