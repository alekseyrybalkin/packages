#!/bin/sh

pkgname=slang
#vcs=git
#gittag=e105c969039a1ec7f83a89863c84260934896260
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
