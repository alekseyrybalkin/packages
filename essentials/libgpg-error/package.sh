#!/bin/sh

pkgname=libgpg-error
pkgver=1.17
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-static --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
