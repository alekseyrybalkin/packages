#!/bin/sh

pkgname=gnome-themes-standard
pkgver=3.8.4
urls="http://download.gnome.org/sources/${pkgname}/3.8/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
