#!/bin/sh

pkgname=libxslt
pkgver=1.1.28
extension=gz
folder="http://xmlsoft.org/sources/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
