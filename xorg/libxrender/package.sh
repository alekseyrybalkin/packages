#!/bin/sh

pkgname=libxrender
pkgver=0.9.10
vcs=git
gittag=libXrender-${pkgver}
relmon_id=1789

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
