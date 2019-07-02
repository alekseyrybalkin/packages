#!/bin/sh

pkgname=libxmu
pkgver=1.1.3
vcs=git
gittag=libXmu-${pkgver}
relmon_id=1785

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
