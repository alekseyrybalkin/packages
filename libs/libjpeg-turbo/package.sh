#!/bin/sh

pkgname=libjpeg-turbo
pkgver=2.0.2
vcs=git
gittag=${pkgver}
urls="http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1648

kiin_make() {
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE  \
        -DENABLE_STATIC=FALSE       \
        -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo \
        -DCMAKE_INSTALL_DEFAULT_LIBDIR=lib \
        ..
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
