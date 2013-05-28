#!/bin/sh

pkgname=flac
pkgver=1.3.0
urls="http://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/#include <stdio.h>/&\n#include <string.h>/' \
        examples/cpp/encode/file/main.cpp
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --disable-thorough-tests \
    --enable-sse \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
