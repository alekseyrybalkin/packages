#!/bin/sh

pkgname=libxxf86vm
pkgver=1.1.2
urls="http://xorg.freedesktop.org/releases/individual/lib/libXxf86vm-${pkgver}.tar.bz2"
srctar=libXxf86vm-${pkgver}.tar.bz2
srcdir=${location}/libXxf86vm-${pkgver}

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
