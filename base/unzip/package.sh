#!/bin/sh

#vcs=none
pkgname=unzip
pkgver=6.0
urls="http://downloads.sourceforge.net/infozip/unzip60.tar.gz"
srctar=unzip60.tar.gz
srcdir=${location}/unzip60
relmon_id=8684

build() {
    sed -i "/MANDIR =/s#)/#)/share/#" unix/Makefile
    sed -i -e 's/CFLAGS="-O -Wall/& -DNO_LCHMOD/' unix/Makefile
    make -f unix/Makefile linux_noasm
}

package() {
    make prefix=${pkgdir}/usr install
}
