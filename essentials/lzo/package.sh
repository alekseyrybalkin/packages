#!/bin/sh

pkgname=lzo
pkgver=2.06
extension=gz
folder="http://www.oberhumer.com/opensource/${pkgname}/download/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
