#!/bin/sh

pkgname=libxfixes
pkgver=5.0.3
vcs=git
gittag=libXfixes-${pkgver}
relmon_id=1775

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
