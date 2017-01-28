#!/bin/sh

pkgname=socat
pkgver=1.7.3.2
vcs=git
gittag=tag-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i 's/yodl2html/true/g' Makefile.in
    sed -i 's/yodl2man/true/g' Makefile.in
    autoconf
    ./configure --prefix=/usr
    make
    touch doc/socat.1
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/usr/share
}
