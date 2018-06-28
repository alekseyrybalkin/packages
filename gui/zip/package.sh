#!/bin/sh

#vcs=none
pkgname=zip
pkgver=3.0
urls="http://downloads.sourceforge.net/infozip/zip30.tar.gz"
srctar=zip30.tar.gz
srcdir=${location}/zip30
relmon_id=10080

undead_make() {
    make -f unix/Makefile generic_gcc
}

undead_install() {
    make prefix=${pkgdir}/usr \
        MANDIR=${pkgdir}/usr/share/man/man1 \
        -f unix/Makefile install
}
