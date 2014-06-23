#!/bin/sh

pkgname=libwebp
pkgver=0.4.0
urls="http://webp.googlecode.com/files/${pkgname}-${pkgver}.tar.gz \
  http://rybalkin.org/kiin-files/libwebp-0.4.0-giflib-5.1.0.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -p1 -i ${KIIN_HOME}/tarballs/libwebp-0.4.0-giflib-5.1.0.patch
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
