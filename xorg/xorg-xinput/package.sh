#!/bin/sh

_pkgname=xinput
pkgname=xorg-${_pkgname}
pkgver=1.6.3
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
