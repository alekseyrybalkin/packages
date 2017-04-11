#!/bin/sh

pkgname=xf86-input-mouse
pkgver=1.9.2
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-input-mouse
gittag=${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
