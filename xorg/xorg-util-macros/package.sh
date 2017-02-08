#!/bin/sh

pkgname=xorg-util-macros
pkgver=1.19.1
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/util/macros
gittag=util-macros-${pkgver}
srcdir=${location}/util-macros-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
