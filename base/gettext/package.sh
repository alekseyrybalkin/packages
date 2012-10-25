#!/bin/sh

pkgname=gettext
pkgver=0.18.1.1
urls="http://ftp.gnu.org/gnu/gettext/gettext-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gettext-*/*/stdio.in.h
  ./configure --prefix=/usr \
              --docdir=/usr/share/doc/gettext-0.18.1.1 \
              --with-included-libxml \
              --without-git
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
