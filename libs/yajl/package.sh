#!/bin/sh

pkgname=yajl
pkgver=2.1.0
vcs=git
gittag=${pkgver}
relmon_id=5283

kiin_make() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
