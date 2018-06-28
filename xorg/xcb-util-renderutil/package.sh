#!/bin/sh

pkgname=xcb-util-renderutil
pkgver=0.3.9
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/util-renderutil
gittag=${pkgver}
relmon_id=5169

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/xcb-util-common-m4 m4
    git submodule update --init
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
