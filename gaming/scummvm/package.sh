#!/bin/sh

pkgname=scummvm
pkgver=1.7.0
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --disable-debug --enable-release --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
