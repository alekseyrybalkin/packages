#!/bin/sh

pkgname=desktop-file-utils
pkgver=0.23
vcs=git
# FIXME
#gittag=${pkgver}
gittag=56f879e9564b28886565115ea7528ec13db97759
relmon_id=421

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
