#!/bin/sh

pkgname=libxfixes
pkgver=5.0
urls="http://xorg.freedesktop.org/releases/individual/lib/libXfixes-${pkgver}.tar.bz2"
srctar=libXfixes-${pkgver}.tar.bz2
srcdir=${location}/libXfixes-${pkgver}

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
