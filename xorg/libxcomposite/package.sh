#!/bin/sh

pkgname=libxcomposite
pkgver=0.4.5
vcs=git
gittag=libXcomposite-${pkgver}
relmon_id=1769

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
