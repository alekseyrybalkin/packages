#!/bin/sh

pkgname=giflib
pkgver=5.1.4
vcs=git
gittag=${pkgver}
urls="http://downloads.sourceforge.net/giflib/giflib-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
