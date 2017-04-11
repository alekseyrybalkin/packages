#!/bin/sh

pkgname=libnl
pkgver=3.2.29
vcs=git
gittag=libnl${pkgver//\./_}
urls="https://github.com/thom311/libnl/releases/download/libnl${pkgver//\./_}/libnl-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
