#!/bin/sh

pkgname=libxpm
pkgver=3.5.12
vcs=git
gittag=libXpm-${pkgver}
relmon_id=1787

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
