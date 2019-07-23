#!/bin/sh

pkgname=glu
pkgver=9.0.0
vcs=git
gittag=glu-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=$XORG_PREFIX \
        --disable-static \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
