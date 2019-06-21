#!/bin/sh

pkgname=pixman
pkgver=0.38.4
vcs=git
gittag=pixman-${pkgver}
relmon_id=3648

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static --disable-gtk --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
