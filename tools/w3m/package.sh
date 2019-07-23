#!/bin/sh

pkgname=w3m
pkgver=0.5.3+git20190105
vcs=git
gittag=v${pkgver}
relmon_id=5115

kiin_make() {
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --enable-image=no \
        --with-termlib=ncurses \
        --disable-w3mmailer
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
