#!/bin/sh

#vcs=none
pkgname=icon-naming-utils
pkgver=0.8.90
urls="http://tango.freedesktop.org/releases/icon-naming-utils-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib/icon-naming-utils
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
