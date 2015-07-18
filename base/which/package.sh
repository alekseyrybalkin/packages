#!/bin/sh

pkgname=which
pkgver=2.21
extension=gz
folder="http://ftp.gnu.org/gnu/which/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
