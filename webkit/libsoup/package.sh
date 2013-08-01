#!/bin/sh

pkgname=libsoup
majorver=2.43
pkgver=${majorver}.5
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-static --without-gnome
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
