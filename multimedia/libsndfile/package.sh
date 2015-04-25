#!/bin/sh

pkgname=libsndfile
pkgver=1.0.25
urls="http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --prefix=/usr --disable-static --libdir=${LIBDIR}
  else
    ./configure --prefix=/usr --disable-static --disable-external-libs --libdir=${LIBDIR}
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
