#!/bin/sh

pkgname=poppler
pkgver=0.61
ARCH_VERSION=${pkgver}.0
vcs=git
gittag=poppler-${pkgver}
# extra zeroes in versions
#relmon_id=3686

kiin_make() {
    patch -Np1 -i ../fix-incorrect-paths-in-pc-files.patch

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
    mv ${pkgdir}/usr/lib{64,}
}
