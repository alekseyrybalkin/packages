#!/bin/sh

pkgname=glfw
pkgver=3.2.1
vcs=git
gittag=${pkgver}
relmon_id=1180
relmon_sed='s/\.bin\.WIN64//g'

undead_make() {
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    make
}

undead_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
