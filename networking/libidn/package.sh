#!/bin/sh

pkgname=libidn
pkgver=1.33
vcs=git
gittag=libidn-${pkgver//\./-}
urls="http://ftp.gnu.org/gnu/libidn/libidn-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    MAKEFLAGS=
    sed -i -e 's/\ doc//g' Makefile.am
    sed -i -e 's/\ po//g' Makefile.am
    sed -i -e '/doc\//d' configure.ac
    sed -i -e '/po\//d' configure.ac
    sed -i -e '/AM_GNU_GETTEXT/d' configure.ac
    touch ChangeLog
    autoreconf -fi
    ./configure --prefix=/usr --disable-static --libdir=${LIBDIR}
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
