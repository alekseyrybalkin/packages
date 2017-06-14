#!/bin/sh

# XXX wants network access to git clone Catch
pkgname=libjson-rpc-cpp
pkgver=0.7.0
vcs=git
gittag=v${pkgver}
relmon_id=12896

kiin_make() {
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -type d -name .git -exec rm -r '{}' +
}
