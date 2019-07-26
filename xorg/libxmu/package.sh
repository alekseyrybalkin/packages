#!/bin/sh

pkgname=libxmu
pkgver=1.1.3
vcs=git
gittag=libXmu-${pkgver}
relmon_id=1785

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
