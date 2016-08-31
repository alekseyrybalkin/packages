#!/bin/sh

pkgname=glfw
pkgver=3.2.1
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/doc
    cp -r docs ${pkgdir}/usr/share/doc/glfw
    cp -r examples ${pkgdir}/usr/share/doc/glfw/
}
