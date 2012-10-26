#!/bin/sh

pkgname=rsync
pkgver=3.0.9
urls="http://samba.org/ftp/rsync/src/rsync-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
