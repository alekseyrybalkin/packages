#!/bin/sh

pkgname=file
pkgver=5.25
vcs=git
gittag=FILE${pkgver//\./_}
urls="ftp://ftp.astron.com/pub/file/file-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
