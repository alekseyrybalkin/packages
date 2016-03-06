#!/bin/sh

pkgname=gtkmm
_majorver=3.18
pkgver=${_majorver}.0
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
