#!/bin/sh

pkgname=gettext
pkgver=0.19.4
urls="http://ftp.gnu.org/gnu/gettext/gettext-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/gettext \
    --with-included-libxml \
    --with-included-glib \
    --with-included-libcroco \
    --without-git \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
