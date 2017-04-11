#!/bin/sh

pkgname=python-protobuf
ARCH_NAME=protobuf
# also see dev/protobuf
pkgver=3.2.0
_gtestver=1.8.0
vcs=git
vcs_pkgname=protobuf
gittag=v${pkgver}
relmon_id=3715

kiin_make() {
    export CC=/usr/bin/clang CXX=/usr/bin/clang++

    git clone -s -n ${SOURCES_HOME}/googletest _googletest
    cd _googletest
    git checkout release-${_gtestver}
    cd ../

    rm -rf gmock
    cp -r _googletest/googlemock gmock
    rm -rf googletest
    cp -r _googletest/googletest googletest
    ln -sf ../googletest gmock/gtest

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    cd python
    python setup.py install --root=${pkgdir}
}
