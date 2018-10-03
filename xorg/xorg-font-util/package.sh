#!/bin/sh

_pkgname=font-util
pkgname=xorg-${_pkgname}
pkgver=1.3.1
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/font/util
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
