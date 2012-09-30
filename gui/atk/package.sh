#!/bin/sh

pkgname=atk
pkgver=2.6.0
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.6/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
