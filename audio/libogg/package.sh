#!/bin/sh

pkgname=libogg
pkgver=1.3.3
vcs=git
gittag=v${pkgver}
relmon_id=1694

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
