#!/bin/sh

pkgname=automake
pkgver=1.15
extension=xz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --docdir=/usr/share/doc/${pkgname}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
