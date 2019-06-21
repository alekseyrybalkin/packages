#!/bin/sh

pkgname=libxcomposite
pkgver=0.4.5
vcs=git
gittag=libXcomposite-${pkgver}
relmon_id=1769

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
