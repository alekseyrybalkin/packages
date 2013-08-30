#!/bin/sh

pkgname=gtk
majorver=3.8
pkgver=${majorver}.4
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}+/"
check_server=1

srctar=${pkgname}+-${pkgver}.tar.${extension}
srcdir=${location}/${pkgname}+-${pkgver}

. ${KIIN_HOME}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"
ver_grep="^${pkgname}\+-.*\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}\+-//g" | sed -r "s/\.tar\.${extension}$//g"
}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  gtk-query-immodules-3.0 --update-cache
  glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
  kiin_after_install
}
