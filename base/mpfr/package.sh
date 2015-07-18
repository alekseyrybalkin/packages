#!/bin/sh

pkgname=mpfr
_pkgver=3.1.3
pkgver=${_pkgver}
urls="http://www.mpfr.org/mpfr-${_pkgver}/mpfr-${_pkgver}.tar.xz"
srctar=${pkgname}-${_pkgver}.tar.xz
srcdir=${location}/${pkgname}-${_pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --enable-thread-safe \
    --disable-static \
    --docdir=/usr/share/doc/mpfr
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install-html
}
