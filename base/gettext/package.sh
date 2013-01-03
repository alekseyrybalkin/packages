#!/bin/sh

pkgname=gettext
pkgver=0.18.2
urls="http://ftp.gnu.org/gnu/gettext/gettext-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/gettext-${pkgver} \
    --with-included-libxml \
    --without-git \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
