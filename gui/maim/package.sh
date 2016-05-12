#!/bin/sh

pkgname=maim
pkgver=3.4.47
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
