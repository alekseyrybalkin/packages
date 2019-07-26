#!/bin/sh

pkgname=libx11
pkgver=1.6.8
vcs=git
gittag=libX11-${pkgver}
relmon_id=1764

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
