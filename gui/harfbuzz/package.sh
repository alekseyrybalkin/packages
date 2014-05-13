#!/bin/sh

pkgname=harfbuzz
pkgver=0.9.27
urls="http://www.freedesktop.org/software/${pkgname}/release/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --prefix=/usr --libdir=$LIBDIR
  else
    ./configure --prefix=/usr --with-icu=no --with-cairo=no --libdir=$LIBDIR
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
