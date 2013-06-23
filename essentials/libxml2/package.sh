#!/bin/sh

pkgname=libxml2
pkgver=2.9.1
extension=gz
folder="http://xmlsoft.org/sources/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-static --with-history
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
