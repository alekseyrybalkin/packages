#!/bin/sh

pkgname=flex
pkgver=2.6.4
vcs=git
gittag=v${pkgver}
relmon_id=819

kiin_make() {
    MAKEFLAGS=
    ./autogen.sh
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/${pkgname}
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    ln -sv flex ${pkgdir}/usr/bin/lex
}
