#!/bin/sh

pkgname=xf86-input-synaptics
pkgver=1.9.0
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics
gittag=${pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
