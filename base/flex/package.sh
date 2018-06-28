#!/bin/sh

pkgname=flex
pkgver=2.6.4
vcs=git
gittag=v${pkgver}
urls="http://prdownloads.sourceforge.net/flex/flex-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=819

undead_make() {
    MAKEFLAGS=
    ./autogen.sh
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/${pkgname}
    make
}

undead_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    ln -sv flex ${pkgdir}/usr/bin/lex
}
