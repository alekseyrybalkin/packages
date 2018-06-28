#!/bin/sh

pkgname=elfutils
pkgver=0.170
vcs=git
gittag=elfutils-${pkgver}
relmon_id=5679

undead_make() {
    autoreconf -fi
    ./configure --prefix=/usr \
        --program-prefix="eu-" \
        --enable-deterministic-archives \
        --enable-maintainer-mode
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
