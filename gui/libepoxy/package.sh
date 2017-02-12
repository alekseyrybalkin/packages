#!/bin/sh

pkgname=libepoxy
pkgver=1.4
ARCH_VERSION=${pkgver}.0
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
