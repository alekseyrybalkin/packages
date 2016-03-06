#!/bin/sh

pkgname=gdl
_majorver=3.18
pkgver=${_majorver}.0
urls="http://ftp.gnome.org/pub/gnome/sources/gdl/${_majorver}/gdl-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
