#!/bin/sh

pkgname=poppler
pkgver=0.63.0
vcs=git
gittag=poppler-${pkgver}
# extra zeroes in versions
#relmon_id=3686

undead_make() {
    mkdir build
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTESTDATADIR=$PWD/testfiles \
        -DENABLE_XPDF_HEADERS=ON \
        ..
    make
}

undead_install() {
    cd build
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/lib{64,}
}
