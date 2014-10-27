#!/bin/sh

pkgname=json-c
pkgver=0.12
urls="https://s3.amazonaws.com/json-c_releases/releases/json-c-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  sed -i s/-Werror// Makefile.in
  ./configure --prefix=/usr --disable-static --libdir=${LIBDIR}
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}
