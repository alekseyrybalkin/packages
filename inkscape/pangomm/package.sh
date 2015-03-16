#!/bin/sh

pkgname=pangomm
_majorver=2.34
pkgver=${_majorver}.0
urls="http://ftp.gnome.org/pub/gnome/sources/pangomm/${_majorver}/pangomm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
