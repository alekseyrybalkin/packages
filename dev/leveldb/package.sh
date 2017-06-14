#!/bin/sh

pkgname=leveldb
pkgver=1.20
vcs=git
gittag=v${pkgver}
relmon_id=9338

kiin_make() {
    make
}

kiin_install() {
    install -dm755 \
        ${pkgdir}/usr/{include/leveldb,lib} \
        ${pkgdir}/usr/share/doc/${pkgname}

    install -m644 -t ${pkgdir}/usr/lib out-static/libleveldb.a
    cp -P out-shared/libleveldb.so* ${pkgdir}/usr/lib

    install -m644 -t ${pkgdir}/usr/include/leveldb include/leveldb/*

    cp -r doc/* ${pkgdir}/usr/share/doc/${pkgname}
}
