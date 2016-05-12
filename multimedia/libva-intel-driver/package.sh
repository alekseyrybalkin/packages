#!/bin/sh

pkgname=libva-intel-driver
pkgver=1.7.0
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
