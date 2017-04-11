#!/bin/sh

#vcs=cvs
pkgname=popt
pkgver=1.16
urls="ftp://anduin.linuxfromscratch.org/BLFS/svn/p/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    ./configure --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
