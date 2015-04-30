#!/bin/sh

pkgname=grep
pkgver=2.21
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/tp++/a  if (ep <= tp) break;' src/kwset.c
  git clone ${KIIN_HOME}/sources/gnulib
  ./bootstrap --skip-po
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
