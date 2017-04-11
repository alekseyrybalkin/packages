#!/bin/sh

pkgname=xz
pkgver=5.2.3
vcs=git
gittag=v${pkgver}
urls="http://tukaani.org/xz/xz-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/xz
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
