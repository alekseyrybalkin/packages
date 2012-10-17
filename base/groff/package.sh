#!/bin/sh

pkgname=groff
pkgver=1.21
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  PAGE=A4 ./configure --prefix=/usr --without-x
  make
}

kiin_install() {
  make prefix=${pkgdir}/usr install
  ln -sv eqn ${pkgdir}/usr/bin/geqn
  ln -sv tbl ${pkgdir}/usr/bin/gtbl
}
