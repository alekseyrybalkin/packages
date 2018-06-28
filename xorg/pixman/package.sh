#!/bin/sh

pkgname=pixman
pkgver=0.34.0
vcs=git
gittag=pixman-${pkgver}
relmon_id=3648

undead_make() {
    ./autogen.sh --prefix=/usr --disable-static --disable-gtk --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
