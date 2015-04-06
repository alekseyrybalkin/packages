#!/bin/sh

pkgname=doxygen
pkgver=1.8.9.1
vcs=git
gittag=Release_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix /usr
  make
}

kiin_install() {
  make INSTALL=${pkgdir}/usr MAN1DIR=share/man/man1 install
}
