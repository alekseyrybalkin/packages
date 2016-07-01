#!/bin/sh

pkgname=desktop-file-utils
pkgver=0.23
vcs=git
#gittag=${pkgver}
gittag=56f879e9564b28886565115ea7528ec13db97759
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
