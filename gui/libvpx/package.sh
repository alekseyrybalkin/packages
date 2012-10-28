#!/bin/sh

pkgname=libvpx
pkgver=1.1.0
urls="http://webm.googlecode.com/files/libvpx-v${pkgver}.tar.bz2"
srctar=${pkgname}-v${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-v${pkgver}

kiin_make() {
  mkdir libvpx-build
  cd libvpx-build
  ../configure --prefix=/usr \
    --enable-shared \
    --disable-static
  make
}

kiin_install() {
  cd libvpx-build
  make DESTDIR=${pkgdir} install
}
