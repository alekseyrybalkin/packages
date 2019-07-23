#!/bin/sh

pkgname=xkeyboard-config
pkgver=2.27
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=5191

kiin_make() {
    ./autogen.sh $XORG_CONFIG --with-xkb-rules-symlink=xorg
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
