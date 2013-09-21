#!/bin/sh

pkgname=gnome-themes-standard
majorver=3.8
pkgver=${majorver}.4
extension=xz
major_folder="http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
