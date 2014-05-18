#!/bin/sh

pkgname=nettle
pkgver=2.7.1
urls="http://ftp.gnu.org/gnu/nettle/nettle-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --prefix=/usr --libdir=${LIBDIR}
  else
    ./configure --prefix=/usr --libdir=${LIBDIR} \
      --enable-shared --with-include-path=/usr/lib32/gmp
  fi
  make
  sed -i '/^install-here/ s/install-static//' Makefile
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
