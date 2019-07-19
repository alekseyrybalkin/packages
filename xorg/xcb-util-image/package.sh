#!/bin/sh

pkgname=xcb-util-image
pkgver=0.4.0
vcs=git
gittag=${pkgver}
relmon_id=5167

kiin_make() {
    git clone -s `find_vcs_repo xcb-util-m4` m4
    git submodule update --init
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
