#!/bin/sh

pkgname=groff
pkgver=1.22.3
urls="http://ftp.gnu.org/gnu/groff/groff-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  PAGE=A4 ./configure --prefix=/usr --without-x
  make
}

kiin_install() {
  MAKEFLAGS=
  make prefix=${pkgdir}/usr install
  ln -sv eqn ${pkgdir}/usr/bin/geqn
  ln -sv tbl ${pkgdir}/usr/bin/gtbl
  rm -rf ${pkgdir}/usr/share/doc/groff-${pkgver}/pdf
}
