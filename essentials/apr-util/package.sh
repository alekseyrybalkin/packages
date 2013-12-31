#!/bin/sh

pkgname=apr-util
pkgver=1.5.3
extension=bz2
folder="http://archive.apache.org/dist/apr/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --with-apr=/usr \
    --with-gdbm=/usr \
    --with-openssl=/usr \
    --without-pgsql \
    --with-crypto
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
