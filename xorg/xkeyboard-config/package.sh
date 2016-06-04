#!/bin/sh

pkgname=xkeyboard-config
pkgver=2.18
vcs=git
git_repo=git://anongit.freedesktop.org/xkeyboard-config
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --with-xkb-rules-symlink=xorg
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
