#!/bin/sh

pkgname=atkmm
_majorver=2.22
pkgver=${_majorver}.7
urls="http://ftp.gnome.org/pub/gnome/sources/atkmm/${_majorver}/atkmm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
