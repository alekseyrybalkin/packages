#!/bin/sh

pkgname=patch
pkgver=2.7.6
vcs=git
gittag=v${pkgver}
relmon_id=2597

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
