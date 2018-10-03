#!/bin/sh

pkgname=libx11
pkgver=1.6.5
vcs=git
gittag=libX11-${pkgver}
relmon_id=1764

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
