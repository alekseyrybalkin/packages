#!/bin/sh

pkgname=bison
pkgver=3.0.4
vcs=git
gittag=v${pkgver}

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    cd submodules
    git clone -s ${KIIN_HOME}/sources/autoconf
    cd ../
    ./bootstrap --skip-po
    ./configure --prefix=/usr --docdir=/usr/share/doc/bison
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
