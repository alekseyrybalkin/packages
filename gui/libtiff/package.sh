#!/bin/sh

pkgname=libtiff
pkgver=4.0.10
vcs=git
gittag=v${pkgver}
relmon_id=1738

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
