#!/bin/sh

pkgname=libice
pkgver=1.0.8
urls="http://xorg.freedesktop.org/releases/individual/lib/libICE-${pkgver}.tar.bz2"
srctar=libICE-${pkgver}.tar.bz2
srcdir=${location}/libICE-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure $XORG_CONFIG
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure $XORG_CONFIG --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/usr/{include,share,bin}
  fi
}
