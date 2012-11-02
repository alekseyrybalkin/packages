#!/bin/sh

pkgname=glu
pkgver=9.0.0
urls="ftp://ftp.freedesktop.org/pub/mesa/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}
multilib=1

XORG_PREFIX="/usr"

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=$XORG_PREFIX \
      --disable-static
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=$XORG_PREFIX \
      --disable-static --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/usr/{include,share,bin}
  fi
}
