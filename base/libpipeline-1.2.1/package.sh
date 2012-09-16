#!/bin/sh

pkgname=libpipeline
pkgver=1.2.1
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gnulib/lib/stdio.in.h
  PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
