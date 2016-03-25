#!/bin/sh

pkgname=flac
pkgver=1.3.1
vcs=git
gittag=${pkgver}
urls="http://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
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
