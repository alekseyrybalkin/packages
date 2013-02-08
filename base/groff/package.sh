#!/bin/sh

pkgname=groff
pkgver=1.22.2
urls="http://ftp.gnu.org/gnu/groff/groff-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  PAGE=A4 ./configure --prefix=/usr --without-x
  make
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/doc/groff-1.22/pdf
  make prefix=${pkgdir}/usr install
  ln -sv eqn ${pkgdir}/usr/bin/geqn
  ln -sv tbl ${pkgdir}/usr/bin/gtbl
  rm -rvf ${pkgdir}/usr/share/doc/groff-1.22/pdf
}
