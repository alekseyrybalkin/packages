#!/bin/sh

_pkgname=font-util
pkgname=xorg-${_pkgname}
pkgver=1.3.1
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/font/util
gittag=${_pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
