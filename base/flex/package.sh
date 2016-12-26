#!/bin/sh

pkgname=flex
pkgver=2.6.2+
vcs=git
gittag=6bea32e937058ddba2812581b1396ff35aae8d70
urls="http://prdownloads.sourceforge.net/flex/flex-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

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
