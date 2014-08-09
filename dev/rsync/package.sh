#!/bin/sh

pkgname=rsync
pkgver=3.1.1
extension=gz
folder="http://www.samba.org/ftp/rsync/src/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --without-included-zlib \
    --disable-acl-support --disable-xattr-support
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
