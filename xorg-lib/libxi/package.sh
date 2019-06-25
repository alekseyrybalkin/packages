#!/bin/sh

pkgname=libxi
pkgver=1.7.10
vcs=git
gittag=libXi-${pkgver}
relmon_id=1778

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
