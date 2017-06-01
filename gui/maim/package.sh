#!/bin/sh

pkgname=maim
pkgver=5.4.63
vcs=git
gittag=v${pkgver}

kiin_make() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
