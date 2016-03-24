#!/bin/sh

pkgname=doxygen
pkgver=1.8.11
vcs=git
gittag=Release_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DPYTHON_EXECUTABLE:FILE=/usr/bin/python2
    make
}

kiin_install() {
    cd build
    make DESTDIR="${pkgdir}" install
}
