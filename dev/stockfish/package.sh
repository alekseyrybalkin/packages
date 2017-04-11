#!/bin/sh

pkgname=stockfish
SKIP_ARCH_CHECK=1
pkgver=8
vcs=git
gittag=sf_${pkgver}

kiin_make() {
    cd src
    make profile-build ARCH=x86-64-modern
}

kiin_install() {
    cd src
    make PREFIX="$pkgdir/usr" install
}
