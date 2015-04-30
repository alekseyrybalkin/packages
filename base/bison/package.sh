#!/bin/sh

pkgname=bison
pkgver=3.0.4
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git clone ${KIIN_HOME}/sources/gnulib
  cd submodules
  git clone ${KIIN_HOME}/sources/autoconf
  cd ../
  ./bootstrap --skip-po
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
