#!/bin/sh

_pkgname=xrdb
pkgname=xorg-${_pkgname}
pkgver=1.1.1
vcs=git
gittag=${_pkgname}-${pkgver}

kiin_make() {
    export PATH=/usr/bin:${PATH}
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    export PATH=/usr/bin:${PATH}
    make DESTDIR=${pkgdir} install
}
