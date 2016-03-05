#!/bin/sh

pkgname=fribidi
pkgver=0.19.7
urls="http://fribidi.org/download/fribidi-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i "s|glib/gstrfuncs\.h|glib.h|" charset/fribidi-char-sets.c
  sed -i "s|glib/gmem\.h|glib.h|" lib/mem.h
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
