#!/bin/sh

pkgname=at-spi2-atk
majorver=2.9
pkgver=${majorver}.5
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

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
