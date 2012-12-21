#!/bin/sh

pkgname=freetype2
pkgver=2.4.11
urls="http://downloads.sourceforge.net/freetype/freetype-${pkgver}.tar.bz2"
srctar=freetype-${pkgver}.tar.bz2
srcdir=${location}/freetype-${pkgver}

kiin_make() {
  sed -i -r 's:.*(#.*SUBPIXEL.*) .*:\1:' \
    include/freetype/config/ftoption.h
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr --disable-static
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/usr/{include,share,bin}
  fi
}
