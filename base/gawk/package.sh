#!/bin/sh

pkgname=gawk
pkgver=4.1.4
vcs=git
gittag=gawk-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    MAKEFLAGS=
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    mkdir -p -v ${pkgdir}/usr/share/doc/gawk
    cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} ${pkgdir}/usr/share/doc/gawk
}
