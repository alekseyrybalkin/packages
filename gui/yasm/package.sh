#!/bin/sh

pkgname=yasm
pkgver=1.2.0
urls="http://www.tortall.net/projects/yasm/releases/yasm-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's#) ytasm.*#)#' Makefile.in
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
