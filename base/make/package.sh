#!/bin/sh

pkgname=make
pkgver=4.2.1
vcs=git
gittag=${pkgver}
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i -e 's/po //g' Makefile.am
    sed -i -e 's/doc //g' Makefile.am
    sed -i -e 's/-Werror//g' configure.ac
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
