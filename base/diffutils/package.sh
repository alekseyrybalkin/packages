#!/bin/sh

pkgname=diffutils
pkgver=3.7
vcs=git
gittag=v${pkgver}
relmon_id=436

kiin_make() {
    git clone -s ${SOURCES_HOME}/dev/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
