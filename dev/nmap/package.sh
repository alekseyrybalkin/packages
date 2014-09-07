#!/bin/sh

pkgname=nmap
pkgver=6.47
extension=bz2
folder="http://nmap.org/dist/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
