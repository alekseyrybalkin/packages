#!/bin/sh

pkgname=intel-vaapi-driver
ARCH_NAME=libva-intel-driver
pkgver=1.8.3
vcs=git
gittag=${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
