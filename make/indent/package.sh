#!/bin/sh

pkgname=indent
pkgver=2.2.12
vcs=git
gittag=${pkgver}
relmon_id=1378

kiin_make() {
    ./bootstrap
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/local/* ${pkgdir}/usr/
    mv ${pkgdir}/usr/doc ${pkgdir}/usr/share/
    rmdir ${pkgdir}/usr/local
}
