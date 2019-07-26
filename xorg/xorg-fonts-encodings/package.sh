#!/bin/sh

_pkgname=encodings
pkgname=xorg-fonts-${_pkgname}
pkgver=1.0.5
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
