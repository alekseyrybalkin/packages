#!/bin/sh

pkgname=lzo
ARCH_NAME=lzo2
pkgver=2.06
extension=gz
folder="http://www.oberhumer.com/opensource/${pkgname}/download/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
