#!/bin/sh

pkgname=libsm
pkgver=1.2.3
vcs=git
gittag=libSM-${pkgver}
relmon_id=1726

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
