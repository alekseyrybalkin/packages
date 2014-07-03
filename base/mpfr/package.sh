#!/bin/sh

pkgname=mpfr
pkgver=3.1.2
ARCH_VERSION=3.1.2.p10
urls="http://www.mpfr.org/mpfr-${pkgver}/mpfr-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure  --prefix=/usr        \
              --enable-thread-safe \
              --docdir=/usr/share/doc/mpfr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make html
  make DESTDIR=${pkgdir} install-html
}
