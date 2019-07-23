#!/bin/sh

pkgname=xorg-util-macros
pkgver=1.19.2
vcs=git
gittag=util-macros-${pkgver}
relmon_id=15037

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
