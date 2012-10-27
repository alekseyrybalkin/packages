#!/bin/sh

pkgname=flac
pkgver=1.2.1
urls="http://downloads.sourceforge.net/flac/flac-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/#include <stdio.h>/&\n#include <string.h>/' \
        examples/cpp/encode/file/main.cpp
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --disable-thorough-tests \
    --enable-sse \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
