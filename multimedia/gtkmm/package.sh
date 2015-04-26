#!/bin/sh

pkgname=gtkmm
_majorver=2.24
pkgver=${_majorver}.4
urls="http://ftp.gnome.org/pub/gnome/sources/gtkmm/${_majorver}/gtkmm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
