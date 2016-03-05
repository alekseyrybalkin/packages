#!/bin/sh

pkgname=libass
pkgver=0.13.2
urls="https://github.com/libass/libass/releases/download/${pkgver}/libass-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-harfbuzz --enable-fontconfig --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
