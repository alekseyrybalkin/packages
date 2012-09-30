#!/bin/sh

pkgname=libpng
pkgver=1.5.13
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz \
  http://sourceforge.net/projects/${pkgname}-apng/files/${pkgname}15/${pkgver}/${pkgname}-${pkgver}-apng.patch.gz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  gzip -cd ../${pkgname}-${pkgver}-apng.patch.gz | patch -p1
  ./configure --prefix=/usr \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  cp README libpng-manual.txt ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
