#!/bin/sh

pkgname=transmission
pkgver=2.90
extension=xz
folder="http://download-origin.transmissionbt.com/files/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
