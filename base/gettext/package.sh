#!/bin/sh

pkgname=gettext
pkgver=0.19.4
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  git clone ${KIIN_HOME}/sources/gnulib
  ./autogen.sh
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
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}
