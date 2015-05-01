#!/bin/sh

pkgname=mpd-mpc
ARCH_NAME=mpc
pkgver=0.26
vcs=git
gittag=v${pkgver}
srcdir=${location}/mpc-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
