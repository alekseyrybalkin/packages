#!/bin/sh

pkgname=xf86-input-keyboard
pkgver=1.8.1
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-input-keyboard
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
