#!/bin/sh

pkgname=freeglut
pkgver=2.8.0
urls="http://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/freeglut-${pkgver}-remove_smooth_opengl3_demo-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../freeglut-${pkgver}-remove_smooth_opengl3_demo-1.patch
  if [ -n "$KIIN_LIB32" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  else
    ./configure --prefix=/usr --disable-static
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/{usr/{include,share,bin},etc}
  fi
}
