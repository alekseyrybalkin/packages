#!/bin/sh

pkgname=libice
pkgver=1.0.10
vcs=git
gittag=libICE-${pkgver}
relmon_id=1638

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
