#!/bin/sh

pkgname=freeciv
pkgver=2.3.4
urls="http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --enable-client=gtk2 \
    --enable-shared \
    --without-ggz-client
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
