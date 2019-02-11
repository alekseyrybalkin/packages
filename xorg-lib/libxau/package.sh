#!/bin/sh

pkgname=libxau
pkgver=1.0.9
vcs=git
gittag=libXau-${pkgver}
relmon_id=1765

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
