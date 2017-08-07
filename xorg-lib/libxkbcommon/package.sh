#!/bin/sh

pkgname=libxkbcommon
pkgver=0.7.2
vcs=git
gittag=xkbcommon-${pkgver}
relmon_id=1780

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
