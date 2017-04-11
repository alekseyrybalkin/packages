#!/bin/sh

pkgname=gzip
pkgver=1.8
vcs=git
gittag=v${pkgver}

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make prefix=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/bin
    mv -v ${pkgdir}/bin/* ${pkgdir}/usr/bin
    rm -rf ${pkgdir}/bin
    mv -v ${pkgdir}/share ${pkgdir}/usr
}
