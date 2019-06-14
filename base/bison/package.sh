#!/bin/sh

pkgname=bison
pkgver=3.4.1
vcs=git
gittag=v${pkgver}
relmon_id=193

kiin_make() {
    git clone -s ${SOURCES_HOME}/dev/gnulib
    cd submodules
    git clone -s ${SOURCES_HOME}/base/autoconf
    cd ../
    git submodule update --init
    sed -i -e 's/gnulib-po//g' Makefile.am
    sed -i -e '/gnulib-po/d' configure.ac
    ./bootstrap --skip-po
    ./configure --prefix=/usr --docdir=/usr/share/doc/bison
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
