#!/bin/sh

pkgname=apr
pkgver=1.4.8
extension=bz2
folder="http://archive.apache.org/dist/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-static \
    --with-installbuilddir=/usr/share/apr-1/build
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
