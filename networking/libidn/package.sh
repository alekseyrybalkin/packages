#!/bin/sh

#vcs=git
pkgname=libidn
pkgver=1.32
urls="http://ftp.gnu.org/gnu/libidn/libidn-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
