#!/bin/sh

pkgname=m4
pkgver=1.4.18
vcs=git
gittag=v${pkgver}
relmon_id=1871

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make prefix=${pkgdir}/usr install
}
