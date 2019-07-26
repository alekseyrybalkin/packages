#!/bin/sh

pkgname=libxss
pkgver=1.2.3
vcs=git
gittag=libXScrnSaver-${pkgver}
relmon_id=1791

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
