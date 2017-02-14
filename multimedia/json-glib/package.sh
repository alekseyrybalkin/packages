#!/bin/sh

pkgname=json-glib
vcs=git

pkgver=1.2.2
ARCH_VERSION=1.2.2+4+gd725fb5
gittag=${pkgver}

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
