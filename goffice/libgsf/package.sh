#!/bin/sh

pkgname=libgsf
pkgver=1.14.30
urls="http://ftp.gnome.org/pub/gnome/sources/libgsf/1.14/libgsf-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
