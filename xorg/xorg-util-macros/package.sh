#!/bin/sh

pkgname=xorg-util-macros
pkgver=1.19.2
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/util/macros
gittag=util-macros-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
