#!/bin/sh

pkgname=libva
pkgver=2.4.1
vcs=git
gittag=${pkgver}
# rc
#relmon_id=1752

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
