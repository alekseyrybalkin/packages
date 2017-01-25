#!/bin/sh

pkgname=libtool
pkgver=2.4.6
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    MAKEFLAGS=
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
