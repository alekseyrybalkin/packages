#!/bin/sh

pkgname=libvorbis
pkgver=1.3.3
urls="http://downloads.xiph.org/releases/vorbis/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -v -m644 doc/Vorbis* ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
