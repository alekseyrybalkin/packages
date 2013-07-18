#!/bin/sh

pkgname=prelink
pkgver=20130503
extension=bz2
folder="http://people.redhat.com/jakub/prelink/"
check_server=1

. ${KIIN_HOME}/defaults.sh

srcdir=${location}/${pkgname}

kiin_make() {
  ./configure --prefix=/usr --mandir=/usr/share/man --sbin=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -Dm0644 ../prelink.conf ${pkgdir}/etc/prelink.conf
}
