#!/bin/sh

pkgname=xf86-input-evdev
pkgver=2.10.2
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-input-evdev
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
