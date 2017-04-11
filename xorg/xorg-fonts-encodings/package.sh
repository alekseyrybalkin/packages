#!/bin/sh

_pkgname=encodings
pkgname=xorg-fonts-${_pkgname}
pkgver=1.0.4
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/font/encodings
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
