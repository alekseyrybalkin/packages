#!/bin/sh

pkgname=neon
pkgver=0.30.0
extension=gz
folder="http://www.webdav.org/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-static --with-ssl
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
