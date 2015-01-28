#!/bin/sh

pkgname=gnumeric
pkgver=1.12.19
urls="http://ftp.gnome.org/pub/gnome/sources/gnumeric/1.12/gnumeric-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
