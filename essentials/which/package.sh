#!/bin/sh

pkgname=which
pkgver=2.20
extension=gz
folder="http://carlo17.home.xs4all.nl/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
