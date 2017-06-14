#!/bin/sh

pkgname=jsoncpp
pkgver=1.8.0
vcs=git
gittag=${pkgver}
relmon_id=7483

kiin_make() {
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DJSONCPP_WITH_TESTS=OFF
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
