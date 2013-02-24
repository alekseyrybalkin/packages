#!/bin/sh

pkgname=libexif
pkgver=0.6.21
urls="http://downloads.sourceforge.net/libexif/libexif-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --with-doc-dir=/usr/share/doc/libexif \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
