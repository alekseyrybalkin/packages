#!/bin/sh

pkgname=openjpeg
pkgver=2.3.0
vcs=git
gittag=v${pkgver}
relmon_id=8468

undead_make() {
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DOC=off
    make
}

undead_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
