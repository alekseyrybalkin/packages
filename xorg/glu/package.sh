#!/bin/sh

pkgname=glu
pkgver=9.0.0
vcs=git
git_repo=git://anongit.freedesktop.org/mesa/glu
gittag=glu-${pkgver}

undead_make() {
    ./autogen.sh --prefix=$XORG_PREFIX \
        --disable-static \
        --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
