#!/bin/sh

pkgname=libsigc++
_majorver=2.4
pkgver=${_majorver}.1
urls="http://ftp.gnome.org/pub/gnome/sources/libsigc++/${_majorver}/libsigc++-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
