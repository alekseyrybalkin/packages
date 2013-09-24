#!/bin/sh

pkgname=gnome-icon-theme
majorver=3.10
pkgver=${majorver}.0
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
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

kiin_after_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/gnome
}

kiin_after_upgrade() {
  kiin_after_install
}
