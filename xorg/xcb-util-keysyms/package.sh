#!/bin/sh

pkgname=xcb-util-keysyms
pkgver=0.4.0
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/util-keysyms
gittag=${pkgver}
relmon_id=5168

kiin_make() {
    git clone -s ${SOURCES_HOME}/xorg/xcb-util-m4 m4
    git submodule update --init
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
