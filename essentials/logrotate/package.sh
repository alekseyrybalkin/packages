#!/bin/sh

pkgname=logrotate
pkgver=3.9.1
urls="http://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
