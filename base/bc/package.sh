#!/bin/sh

pkgname=bc
pkgver=2.1.1
vcs=git
gittag=${pkgver}

kiin_make() {
    PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
