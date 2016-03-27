#!/bin/sh

#vcs=svn
pkgname=wv
pkgver=1.2.9
urls="http://www.abisource.com/downloads/wv/${pkgver}/wv-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
