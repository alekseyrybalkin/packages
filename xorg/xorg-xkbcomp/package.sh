#!/bin/sh

_pkgname=xkbcomp
pkgname=xorg-${_pkgname}
pkgver=1.4.2
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
