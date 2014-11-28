#!/bin/sh

pkgname=flac
pkgver=1.3.1
urls="http://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-thorough-tests \
    --enable-sse \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
