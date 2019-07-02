#!/bin/sh

pkgname=libxxf86vm
pkgver=1.1.4
vcs=git
gittag=libXxf86vm-${pkgver}
relmon_id=1799

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
