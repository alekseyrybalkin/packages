#!/bin/sh

pkgname=intel-vaapi-driver
ARCH_NAME=libva-intel-driver
pkgver=2.1.0
vcs=git
gittag=${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
