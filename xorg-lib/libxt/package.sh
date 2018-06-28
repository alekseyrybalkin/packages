#!/bin/sh

pkgname=libxt
pkgver=1.1.5
vcs=git
gittag=libXt-${pkgver}
relmon_id=1793

undead_make() {
    ./autogen.sh $XORG_CONFIG \
        --with-appdefaultdir=/etc/X11/app-defaults \
        --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
