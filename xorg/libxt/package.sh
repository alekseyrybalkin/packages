#!/bin/sh

pkgname=libxt
pkgver=1.2.0
vcs=git
gittag=libXt-${pkgver}
relmon_id=1793

build() {
    ./autogen.sh $XORG_CONFIG \
        --with-appdefaultdir=/etc/X11/app-defaults \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
