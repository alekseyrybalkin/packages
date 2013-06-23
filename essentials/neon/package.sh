#!/bin/sh

pkgname=neon
pkgver=0.29.6
extension=gz
folder="http://www.webdav.org/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
