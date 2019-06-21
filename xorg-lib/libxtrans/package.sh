#!/bin/sh

pkgname=libxtrans
ARCH_NAME=xtrans
pkgver=1.4.0
vcs=git
gittag=xtrans-${pkgver}
relmon_id=13651

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
