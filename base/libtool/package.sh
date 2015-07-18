#!/bin/sh

pkgname=libtool
pkgver=2.4.6
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git clone ${KIIN_HOME}/sources/gnulib
  ./bootstrap --skip-po
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
