#!/bin/sh

pkgname=xcb-proto
pkgver=1.13
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13646

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
