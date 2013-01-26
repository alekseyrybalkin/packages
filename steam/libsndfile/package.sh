#!/bin/sh

pkgname=libsndfile
pkgver=1.0.25
urls=" http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} htmldocdir=/usr/share/doc/libsndfile-${pkgver} install
}
