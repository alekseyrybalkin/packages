#!/bin/sh

pkgname=giflib
pkgver=5.1.4
vcs=git
gittag=${pkgver}
urls="http://downloads.sourceforge.net/giflib/giflib-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=1158

undead_make() {
    ./autogen.sh --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
