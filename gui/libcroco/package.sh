#!/bin/sh

pkgname=libcroco
pkgver=0.6.11
urls="http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
