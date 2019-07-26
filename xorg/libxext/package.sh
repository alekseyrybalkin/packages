#!/bin/sh

pkgname=libxext
pkgver=1.3.4
vcs=git
gittag=libXext-${pkgver}
relmon_id=1774

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
