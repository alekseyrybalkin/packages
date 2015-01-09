#!/bin/sh

pkgname=libevent
pkgver=2.0.22
urls="http://sourceforge.net/projects/levent/files/libevent/libevent-${pkgver%.*}/libevent-${pkgver}-stable.tar.gz"
srctar=${pkgname}-${pkgver}-stable.tar.gz
srcdir=${location}/${pkgname}-${pkgver}-stable

kiin_make() {
  sed -i 's#python#python2#' event_rpcgen.py
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
