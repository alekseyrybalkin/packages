#!/bin/sh

pkgname=poppler
pkgver=0.60.1
vcs=git
gittag=poppler-${pkgver}
# extra zeroes in versions
#relmon_id=3686

kiin_make() {
    mkdir build
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTESTDATADIR=$PWD/testfiles \
        -DENABLE_XPDF_HEADERS=ON \
        ..
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
