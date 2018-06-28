#!/bin/sh

pkgname=diffutils
pkgver=3.6
vcs=git
gittag=v${pkgver}
relmon_id=436

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
