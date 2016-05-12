#!/bin/sh

pkgname=libxt
pkgver=1.1.5
vcs=git
gittag=libXt-${pkgver}
srcdir=${location}/libXt-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG \
        --with-appdefaultdir=/etc/X11/app-defaults \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
