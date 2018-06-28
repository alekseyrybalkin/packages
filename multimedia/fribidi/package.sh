#!/bin/sh

pkgname=fribidi
pkgver=0.19.7
vcs=git
gittag=${pkgver}
urls="http://fribidi.org/download/fribidi-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=857

undead_make() {
    MAKEFLAGS=
    sed -i -e 's/\ doc//g' Makefile.am
    ./bootstrap
    ./configure --prefix=/usr
}

undead_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
