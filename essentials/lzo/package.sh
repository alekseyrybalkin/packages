#!/bin/sh

pkgname=lzo
pkgver=2.06
urls="http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
