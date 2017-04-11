#!/bin/sh

pkgname=fribidi
pkgver=0.19.7
vcs=git
gittag=${pkgver}
urls="http://fribidi.org/download/fribidi-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    MAKEFLAGS=
    sed -i -e 's/\ doc//g' Makefile.am
    ./bootstrap
    ./configure --prefix=/usr
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
