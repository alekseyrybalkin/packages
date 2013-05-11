#!/bin/sh

pkgname=wine
pkgver=1.5.30
urls="http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # Allow ccache to work
  cd ..
  cp -r ${pkgname}-${pkgver} ${pkgname}

  mkdir ${pkgname}-32-build

  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="${CXXFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  mkdir ${pkgname}-64-build
  cd ${pkgname}-64-build
  ../${pkgname}/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --with-x \
    --enable-win64
  make
  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64=$location/${pkgname}-64-build
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd ${location}/${pkgname}-32-build
  ../${pkgname}/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-x \
    "${_wine32opts[@]}"

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
  rm -rf ${pkgname}
}
