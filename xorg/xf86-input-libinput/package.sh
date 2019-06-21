#!/bin/sh

pkgname=xf86-input-libinput
pkgver=0.28.2
vcs=git
gittag=${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
