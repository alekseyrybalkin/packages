#!/bin/sh

pkgname=openjpeg
pkgver=2.3.0
vcs=git
gittag=v${pkgver}
relmon_id=8468

kiin_make() {
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DOC=off
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
