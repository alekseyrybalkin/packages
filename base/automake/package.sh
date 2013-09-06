#!/bin/sh

pkgname=automake
pkgver=1.14
extension=xz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --docdir=/usr/share/doc/${pkgname}-${pkgver}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
