#!/bin/sh

pkgname=xcb-proto
pkgver=1.11
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/proto
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
