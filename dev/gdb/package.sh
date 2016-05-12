#!/bin/sh

pkgname=gdb
pkgver=7.11
vcs=git
vcs_pkgname=binutils-gdb
gittag=gdb-${pkgver}-release
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    rm -rf binutils elfcpp gas gold gprof ld zlib
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} -C gdb install
}
