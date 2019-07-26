#!/bin/sh

_pkgname=xrdb
pkgname=xorg-${_pkgname}
pkgver=1.2.0
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    export PATH=/usr/bin:${PATH}
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    export PATH=/usr/bin:${PATH}
    make DESTDIR=${pkgdir} install
}
