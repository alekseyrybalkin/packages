#!/bin/sh

pkgname=glm
pkgver=0.9.8.4
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}
relmon_id=1181

kiin_make() {
    mkdir build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    cd ..

    mkdir -p ${pkgdir}/usr/share/doc
    cp -r doc ${pkgdir}/usr/share/doc/glm

    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
