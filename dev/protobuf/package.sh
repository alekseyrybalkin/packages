#!/bin/sh

pkgname=protobuf
# also see python-modules/python-protobuf
pkgver=3.2.1
_gtestver=1.8.0
vcs=git
gittag=v${pkgver}
# rc versions
#relmon_id=3715

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
    make DESTDIR=${pkgdir} install
}
