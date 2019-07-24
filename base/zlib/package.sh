#!/bin/sh

pkgname=zlib
pkgver=1.2.11
vcs=git
gittag=v${pkgver}
relmon_id=5303

kiin_make() {
    ./configure --prefix=/usr
    make

    cd contrib/minizip
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install

    mkdir -p ${pkgdir}/usr/bin
    cp contrib/minizip/minizip ${pkgdir}/usr/bin/zip
    cp contrib/minizip/miniunz ${pkgdir}/usr/bin/unzip
}
