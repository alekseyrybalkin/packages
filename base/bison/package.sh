#!/bin/sh

pkgname=bison
pkgver=3.0.4
vcs=git
gittag=v${pkgver}
relmon_id=193

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    cd submodules
    git clone -s ${UNDEAD_HOME}/sources/autoconf
    cd ../
    ./bootstrap --skip-po
    ./configure --prefix=/usr --docdir=/usr/share/doc/bison
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
