#!/bin/sh

pkgname=libdrm
pkgver=2.4.40
urls="http://dri.freedesktop.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=$XORG_PREFIX \
      --enable-udev
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=$XORG_PREFIX \
      --enable-udev \
      --disable-cairo-tests \
      --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/usr/{include,share,bin}
  fi
}
