#!/bin/sh

pkgname=libxv
pkgver=1.0.11
vcs=git
gittag=libXv-${pkgver}
relmon_id=1795

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
