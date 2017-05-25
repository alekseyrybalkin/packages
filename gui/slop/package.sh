#!/bin/sh

pkgname=slop
pkgver=5.3.38
vcs=git
gittag=v${pkgver}

kiin_make() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr . .
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
