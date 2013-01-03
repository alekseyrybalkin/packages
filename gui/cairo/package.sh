#!/bin/sh

pkgname=cairo
pkgver=1.12.8
urls="http://cairographics.org/releases/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static --enable-tee --enable-xcb
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
