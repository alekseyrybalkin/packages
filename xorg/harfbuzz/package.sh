#!/bin/sh

pkgname=harfbuzz
pkgver=2.5.2
vcs=git
gittag=${pkgver}
relmon_id=1299

kiin_make() {
    ./autogen.sh --prefix=/usr --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
