#!/bin/sh

pkgname=nmap
pkgver=6.40
extension=bz2
folder="http://nmap.org/dist/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
