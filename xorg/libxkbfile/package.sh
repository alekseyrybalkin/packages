#!/bin/sh

pkgname=libxkbfile
pkgver=1.1.0
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1781

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
