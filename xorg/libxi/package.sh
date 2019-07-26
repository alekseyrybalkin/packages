#!/bin/sh

pkgname=libxi
pkgver=1.7.10
vcs=git
gittag=libXi-${pkgver}
relmon_id=1778

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
