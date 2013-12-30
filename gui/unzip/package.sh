#!/bin/sh

pkgname=unzip
pkgver=6.0
urls="http://downloads.sourceforge.net/infozip/unzip60.tar.gz"
srctar=unzip60.tar.gz
srcdir=${location}/unzip60

kiin_make() {
  sed -i "/MANDIR =/s#)/#)/share/#" unix/Makefile
  sed -i -e 's/CFLAGS="-O -Wall/& -DNO_LCHMOD/' unix/Makefile
  make -f unix/Makefile linux_noasm
}

kiin_install() {
  make prefix=${pkgdir}/usr install
}
