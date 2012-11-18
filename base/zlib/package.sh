#!/bin/sh

pkgname=zlib
pkgver=1.2.7
urls="http://www.zlib.net/zlib-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=/usr --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    mkdir -pv ${pkgdir}/lib
    mv -v ${pkgdir}/usr/lib/libz.so.* ${pkgdir}/lib
    ln -sfv ../../lib/libz.so.${pkgver} ${pkgdir}/usr/lib/libz.so
  else
    rm -rf ${pkgdir}/usr/{include,share,bin}
  fi
}
