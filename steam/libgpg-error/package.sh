#!/bin/sh

pkgname=libgpg-error
pkgver=1.10
urls="ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
