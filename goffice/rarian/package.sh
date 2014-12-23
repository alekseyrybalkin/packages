#!/bin/sh

pkgname=rarian
pkgver=0.8.1
urls="http://ftp.gnome.org/pub/gnome/sources/rarian/0.8/rarian-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --localstatedir=/var --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/var
}
