#!/bin/sh

pkgname=gsettings-desktop-schemas
pkgver=3.9.2
urls="http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/3.9/gsettings-desktop-schemas-${pkgver}.tar.xz"
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
