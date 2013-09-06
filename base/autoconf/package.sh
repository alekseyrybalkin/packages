#!/bin/sh

pkgname=autoconf
pkgver=2.69
extension=xz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

ver_grep="^${pkgname}-[0-9\.]*\.tar\.${extension}$"

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
