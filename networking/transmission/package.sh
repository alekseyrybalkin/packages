#!/bin/sh

pkgname=transmission
pkgver=2.92
extension=xz
folder="https://download.transmissionbt.com/files/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  sed -i -e '/gtr_get_favicon/d' gtk/details.c
  sed -i -e '/gtr_get_favicon/d' gtk/filter.c
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
