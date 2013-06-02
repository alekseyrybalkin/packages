#!/bin/sh

pkgname=libsoup
pkgver=2.43.2
urls="http://ftp.gnome.org/pub/gnome/sources/libsoup/2.43/libsoup-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static --without-gnome
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
