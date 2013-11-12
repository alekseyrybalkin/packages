#!/bin/sh

pkgname=libsoup
majorver=2.44
pkgver=${majorver}.2
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./configure --prefix=/usr --disable-static --without-gnome
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
