#!/bin/sh

pkgname=inputproto
pkgver=2.3.2
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13508

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
