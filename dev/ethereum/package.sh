#!/bin/sh

# XXX fails to build without libjson-rpc-cpp
pkgname=ethereum
pkgver=1.3.0.401
vcs=git
vcs_pkgname=cpp-ethereum
gittag=develop-v${pkgver}

kiin_make() {
    git clone ${SOURCES_HOME}/evmjit
    cd test
    git clone ${SOURCES_HOME}/ethereum-tests jsontests
    cd ../

    mkdir -p build && pushd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
    popd
}

kiin_install() {
    make DESTDIR=${pkgdir} install -C build

    find ${pkgdir} -type d -name .git -exec rm -r '{}' +
    find ${pkgdir} -type f -name .gitignore -exec rm -r '{}' +
}
