#!/bin/sh

pkgname=patch
pkgver=2.7.5
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
