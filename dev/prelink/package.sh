#!/bin/sh

pkgname=prelink
pkgver=20111012
urls="http://people.redhat.com/jakub/prelink/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}

kiin_make() {
  ./configure --prefix=/usr --mandir=/usr/share/man --sbin=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -Dm0644 ../prelink.conf ${pkgdir}/etc/prelink.conf
}
