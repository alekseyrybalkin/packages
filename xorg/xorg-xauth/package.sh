#!/bin/sh

_pkgname=xauth
pkgname=xorg-${_pkgname}
pkgver=1.1
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
