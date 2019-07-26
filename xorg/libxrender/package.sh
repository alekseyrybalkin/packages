#!/bin/sh

pkgname=libxrender
pkgver=0.9.10
vcs=git
gittag=libXrender-${pkgver}
relmon_id=1789

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
