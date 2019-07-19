#!/bin/sh

pkgname=xcb-util-cursor
pkgver=0.1.3
vcs=git
gittag=${pkgver}
relmon_id=5166

kiin_make() {
    git clone -s `find_vcs_repo xcb-util-m4` m4
    git submodule update --init
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
