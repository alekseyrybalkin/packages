#!/bin/sh

pkgname=xtrans
pkgver=1.3.5
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13651

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
