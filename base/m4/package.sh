#!/bin/sh

pkgname=m4
pkgver=1.4.18
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
    make prefix=${pkgdir}/usr install
}
