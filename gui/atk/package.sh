#!/bin/sh

pkgname=atk
pkgver=2.8.0
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.8/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
