#!/bin/sh

#vcs=cvs
pkgname=lame
pkgver=3.99.5
urls="http://downloads.sourceforge.net/lame/lame-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    ./configure --prefix=/usr \
        --enable-mp3rtp \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} pkghtmldir=/usr/share/doc/lame-${pkgver} install
}
