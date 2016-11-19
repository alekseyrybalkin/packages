#!/bin/sh

pkgname=stockfish
pkgver=8
vcs=git
gittag=sf_${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cd src
    make profile-build ARCH=x86-64-modern
}

kiin_install() {
    cd src
    make PREFIX="$pkgdir/usr" install
}
