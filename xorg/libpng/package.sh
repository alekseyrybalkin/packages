#!/bin/sh

pkgname=libpng
pkgver=1.5.13
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  cp README libpng-manual.txt ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
