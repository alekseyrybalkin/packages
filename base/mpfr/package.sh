#!/bin/sh

pkgname=mpfr
pkgver=3.1.1
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure  --prefix=/usr        \
              --enable-thread-safe \
              --docdir=/usr/share/doc/mpfr-3.1.1
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make html
  make DESTDIR=${pkgdir} install-html
}
