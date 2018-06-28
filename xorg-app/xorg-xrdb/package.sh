#!/bin/sh

_pkgname=xrdb
pkgname=xorg-${_pkgname}
pkgver=1.1.1
vcs=git
gittag=${_pkgname}-${pkgver}

undead_make() {
    export PATH=/usr/bin:${PATH}
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    export PATH=/usr/bin:${PATH}
    make DESTDIR=${pkgdir} install
}
