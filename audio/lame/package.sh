#!/bin/sh

pkgname=lame
pkgver=3.100
vcs=git-svn
vcs_pkgname=lame-git-svn
gittag=origin/tags/RELEASE__${pkgver//\./_}

kiin_make() {
    cd lame
    ./configure --prefix=/usr \
        --enable-mp3rtp \
        --disable-static
    make
}

kiin_install() {
    cd lame
    make DESTDIR=${pkgdir} pkghtmldir=/usr/share/doc/lame-${pkgver} install
}
