#!/bin/sh

pkgname=slop
pkgver=6.3.40
vcs=git
gittag=v${pkgver}

kiin_make() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr . .
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
