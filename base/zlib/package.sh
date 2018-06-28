#!/bin/sh

pkgname=zlib
pkgver=1.2.11
vcs=git
gittag=v${pkgver}
relmon_id=5303

undead_make() {
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
