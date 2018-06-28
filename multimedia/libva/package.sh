#!/bin/sh

pkgname=libva
pkgver=2.1.0
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://www.freedesktop.org/software/vaapi/releases/libva/"
check_server=1
relmon_id=1752

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
