#!/bin/sh

pkgname=glibmm
_majorver=2.44
pkgver=${_majorver}.0
urls="http://ftp.gnome.org/pub/gnome/sources/glibmm/${_majorver}/glibmm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
