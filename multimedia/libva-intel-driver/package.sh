#!/bin/sh

pkgname=libva-intel-driver
pkgver=2.3.0
vcs=git
vcs_pkgname=intel-vaapi-driver
gittag=${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
