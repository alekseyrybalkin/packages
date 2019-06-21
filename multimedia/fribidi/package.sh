#!/bin/sh

pkgname=fribidi
pkgver=1.0.5
vcs=git
gittag=v${pkgver}
urls="http://fribidi.org/download/fribidi-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=857

kiin_make() {
    sed -i -e 's/\ doc//g' Makefile.am
    ./autogen.sh
    ./configure --prefix=/usr
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
