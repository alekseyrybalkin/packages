#!/bin/sh

pkgname=libnl
pkgver=3.2.27
urls="https://github.com/thom311/libnl/releases/download/libnl${pkgver//\./_}/libnl-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
