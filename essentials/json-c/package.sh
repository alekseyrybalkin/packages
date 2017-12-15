#!/bin/sh

pkgname=json-c
pkgver=0.13
vcs=git
gittag=json-c-${pkgver}-20171207
relmon_id=1477

kiin_make() {
    autoreconf -fi
    sed -i s/-Werror// Makefile.in
    ./configure --prefix=/usr \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
