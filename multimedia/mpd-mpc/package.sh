#!/bin/sh

pkgname=mpd-mpc
pkgver=0.22
urls="http://downloads.sourceforge.net/musicpd/mpc-${pkgver}.tar.bz2"
srctar=mpc-${pkgver}.tar.bz2
srcdir=${location}/mpc-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
