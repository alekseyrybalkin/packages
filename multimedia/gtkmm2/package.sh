#!/bin/sh

pkgname=gtkmm2
_majorver=2.24
pkgver=${_majorver}.4
urls="http://ftp.gnome.org/pub/gnome/sources/gtkmm/${_majorver}/gtkmm-${pkgver}.tar.xz"
srctar=gtkmm-${pkgver}.tar.xz
srcdir=${location}/gtkmm-${pkgver}

kiin_make() {
  CXXFLAGS="-g -O2 -std=c++11" ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
