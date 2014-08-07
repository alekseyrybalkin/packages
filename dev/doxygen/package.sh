#!/bin/sh

pkgname=doxygen
pkgver=1.8.7
urls="http://ftp.stack.nl/pub/doxygen/doxygen-${pkgver}.src.tar.gz"
srctar=${pkgname}-${pkgver}.src.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix /usr
  make
}

kiin_install() {
  make INSTALL=${pkgdir}/usr MAN1DIR=share/man/man1 install
}
