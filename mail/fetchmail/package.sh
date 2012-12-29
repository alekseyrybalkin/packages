#!/bin/sh

pkgname=fetchmail
pkgver=6.3.24
urls="http://downloads.sourceforge.net/fetchmail/fetchmail-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-ssl --enable-fallback=procmail
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
