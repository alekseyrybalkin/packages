#!/bin/sh

pkgname=xcb-proto
pkgver=1.12
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/proto
gittag=${pkgver}
relmon_id=13646

kiin_make() {
    patch -Np1 -i ../python-3-fixes.patch
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
