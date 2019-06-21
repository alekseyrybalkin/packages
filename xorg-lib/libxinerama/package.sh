#!/bin/sh

pkgname=libxinerama
pkgver=1.1.4
vcs=git
gittag=libXinerama-${pkgver}
relmon_id=1779

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
