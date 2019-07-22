#!/bin/sh

pkgname=cmake
pkgver=3.14.5
vcs=git
gittag=v${pkgver}
relmon_id=306

kiin_make() {
    ./bootstrap --prefix=/usr \
        --system-libs \
        --mandir=/share/man \
        --docdir=/share/doc/cmake \
        --no-system-jsoncpp \
        --no-system-libarchive
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    # remove files with spaces
    rm -rf ${pkgdir}/usr/share/cmake-*/Help/generator
}
