#!/bin/sh

pkgname=transmission
pkgver=2.80
extension=xz
folder="http://download-origin.transmissionbt.com/files/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --without-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
