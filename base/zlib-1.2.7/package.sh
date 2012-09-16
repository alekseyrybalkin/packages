#!/bin/sh

pkgname=zlib
pkgver=1.2.7
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/lib
  mv -v ${pkgdir}/usr/lib/libz.so.* ${pkgdir}/lib
  ln -sfv ../../lib/libz.so.1.2.7 ${pkgdir}/usr/lib/libz.so
}
