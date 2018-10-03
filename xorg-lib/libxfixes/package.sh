#!/bin/sh

pkgname=libxfixes
pkgver=5.0.3
vcs=git
gittag=libXfixes-${pkgver}
relmon_id=1775

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
