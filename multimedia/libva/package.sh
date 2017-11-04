#!/bin/sh

pkgname=libva
pkgver=2.0.0
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://www.freedesktop.org/software/vaapi/releases/libva/"
check_server=1
relmon_id=1752

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
