#!/bin/sh

pkgname=apr
pkgver=1.5.1
extension=bz2
folder="http://archive.apache.org/dist/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-static \
    --with-installbuilddir=/usr/share/apr-1/build
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
