#!/bin/sh

pkgname=xtrans
pkgver=1.3.5
vcs=git
vcs_pkgname=libxtrans
gittag=${pkgname}-${pkgver}
relmon_id=13651

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
