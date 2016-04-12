#!/bin/sh

pkgname=colm
SKIP_ARCH_CHECK=1
pkgver=0.13.0.3
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}