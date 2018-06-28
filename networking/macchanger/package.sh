#!/bin/sh

pkgname=macchanger
pkgver=1.7.0
vcs=git
gittag=${pkgver}
relmon_id=1873

undead_make() {
    patch -Np1 -i ../0001-don-t-use-hwrng.patch
    ./autogen.sh
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
