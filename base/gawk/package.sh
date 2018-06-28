#!/bin/sh

pkgname=gawk
pkgver=4.2.0
vcs=git
gittag=gawk-${pkgver}
relmon_id=868

undead_make() {
    MAKEFLAGS=
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --libexecdir=/usr/lib
    make
}

undead_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    mkdir -p -v ${pkgdir}/usr/share/doc/gawk
    cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} ${pkgdir}/usr/share/doc/gawk
    rm -rf ${pkgdir}/usr/etc
}
