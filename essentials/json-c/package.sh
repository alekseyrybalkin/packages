#!/bin/sh

pkgname=json-c
pkgver=0.13.1
vcs=git
gittag=json-c-${pkgver}-20180305
relmon_id=1477

undead_make() {
    autoreconf -fi
    sed -i s/-Werror// Makefile.in
    ./configure --prefix=/usr \
        --disable-static
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
