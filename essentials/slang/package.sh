#!/bin/sh

pkgname=slang
majorver=2.3
pkgver=${majorver}.0
extension=bz2
folder="http://www.jedsoft.org/releases/slang/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-png
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install-all
}
