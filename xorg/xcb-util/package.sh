#!/bin/sh

pkgname=xcb-util
pkgver=0.4.0
vcs=git
gittag=${pkgver}
relmon_id=5165

build() {
    git clone -s `find_vcs_repo xcb-util-m4` m4
    git submodule update --init
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
