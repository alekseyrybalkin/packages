#!/bin/sh

pkgname=libtool
pkgver=2.4.2
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}
multilib=1

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    ./configure --prefix=/usr --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf ${pkgdir}/usr/{include,share,bin}
  fi
}
