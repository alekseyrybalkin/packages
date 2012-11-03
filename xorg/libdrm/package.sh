#!/bin/sh

pkgname=libdrm
pkgver=2.4.39
urls="http://dri.freedesktop.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

XORG_PREFIX="/usr"

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=$XORG_PREFIX \
      --enable-udev \
      --enable-vmwgfx-experimental-api
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    sed -i -e "s/cairo/cairofail/g" configure
    sed -i -e "s/cairo/cairofail/g" configure.ac
    ./configure --prefix=$XORG_PREFIX \
      --enable-udev \
      --enable-vmwgfx-experimental-api \
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
