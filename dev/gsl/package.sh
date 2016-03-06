#!/bin/sh

pkgname=gsl
pkgver=2.1
urls="http://ftp.gnu.org/pub/gnu/gsl/gsl-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/doc/gsl
  cp doc/gsl-ref.html/* ${pkgdir}/usr/share/doc/gsl/
}
