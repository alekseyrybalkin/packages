#!/bin/sh

pkgname=gperf
pkgver=3.1
vcs=git
gittag=v${pkgver}
relmon_id=1237

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    for file in build-aux/install-sh build-aux/mkinstalldirs \
                build-aux/compile build-aux/ar-lib; do
        cp gnulib/${file} ${file}
    done
    ./autogen.sh
    ./configure --prefix=/usr --docdir=/usr/share/doc/gperf
    echo -e "all:\n\ninstall:" > doc/Makefile
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
