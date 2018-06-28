#!/bin/sh

pkgname=xmlto
pkgver=0.0.28
vcs=git
# FIXME
gittag=b128bdcf7b15865aaae49635a1dcbcaca07fc6ef
relmon_id=13307

undead_make() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
