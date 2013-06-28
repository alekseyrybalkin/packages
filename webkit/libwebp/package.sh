#!/bin/sh

pkgname=libwebp
pkgver=0.3.1
urls="http://webp.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --enable-swap-16bit-csp \
    --enable-experimental \
    --enable-libwebpmux \
    --enable-libwebpdemux \
    --enable-libwebpdecoder \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
