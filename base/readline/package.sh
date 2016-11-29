#!/bin/sh

pkgname=readline
pkgver=7.0.001
vcs=git
#gittag=readline-${pkgver}
gittag=acf3951d483e7b3478db4d731f4a8af99d27327d
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i '/MV.*old/d' Makefile.in
    sed -i '/{OLDSUFF}/c:' support/shlib-install
    ./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/readline
    make SHLIB_LIBS=-lncurses
}

kiin_install() {
    make DESTDIR=${pkgdir} SHLIB_LIBS=-lncurses install
    mkdir -pv ${pkgdir}/usr/share/doc/readline
    install -v -m644 doc/*.{ps,pdf,html,dvi} \
        ${pkgdir}/usr/share/doc/readline
}
