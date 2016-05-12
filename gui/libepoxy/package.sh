#!/bin/sh

pkgname=libepoxy
pkgver=1.3.1
vcs=git
gittag=v${pkgver}
urls="http://crux.nu/files/libepoxy-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
