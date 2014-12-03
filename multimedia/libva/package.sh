#!/bin/sh

pkgname=libva
pkgver=1.4.1
extension=bz2
folder="http://www.freedesktop.org/software/vaapi/releases/libva/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  mkdir -p m4
  autoreconf -fi
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
