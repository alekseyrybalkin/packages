#!/bin/sh

pkgname=at-spi2-atk
pkgver=2.9.2
urls="http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/2.9/at-spi2-atk-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
  kiin_after_install
}
