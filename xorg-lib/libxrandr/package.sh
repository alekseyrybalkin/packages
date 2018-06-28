#!/bin/sh

pkgname=libxrandr
pkgver=1.5.1
vcs=git
gittag=libXrandr-${pkgver}
relmon_id=1788

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
