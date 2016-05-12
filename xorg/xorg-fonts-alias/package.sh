#!/bin/sh

_pkgname=font-alias
pkgname=xorg-fonts-alias
pkgver=1.0.3
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/font/alias
gittag=${_pkgname}-${pkgver}
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
