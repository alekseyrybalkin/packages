#!/bin/sh

pkgname=freeglut
pkgver=3.0.0
vcs=git
gittag=FG_${pkgver//\./_}
relmon_id=846

kiin_make() {
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
