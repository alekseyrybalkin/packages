#!/bin/sh

pkgname=zlib
pkgver=1.2.8
urls="http://www.zlib.net/zlib-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    mkdir -pv ${pkgdir}/lib
    mv -v ${pkgdir}/usr/lib/libz.so.* ${pkgdir}/lib
    ln -sfv ../../lib/libz.so.${pkgver} ${pkgdir}/usr/lib/libz.so
  fi
}
