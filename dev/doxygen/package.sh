#!/bin/sh

pkgname=doxygen
pkgver=1.8.13
vcs=git
gittag=Release_${pkgver//\./_}
relmon_id=457
relmon_sed='s/\.windows\.x64\.bin//g'

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
