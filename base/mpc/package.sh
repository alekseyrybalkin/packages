#!/bin/sh

pkgname=mpc
ARCH_NAME=libmpc
pkgver=1.0.3
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/mpc
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install html
}
