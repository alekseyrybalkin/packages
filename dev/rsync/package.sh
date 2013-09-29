#!/bin/sh

pkgname=rsync
pkgver=3.1.0
extension=gz
folder="http://www.samba.org/ftp/rsync/src/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
