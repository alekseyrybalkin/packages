#!/bin/sh

pkgname=xcb-util
pkgver=0.4.0
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/util
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/xcb-util-common-m4 m4
    git submodule update --init
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
