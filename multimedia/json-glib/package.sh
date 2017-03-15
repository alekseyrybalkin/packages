#!/bin/sh

pkgname=json-glib
vcs=git

pkgver=1.2.6
ARCH_VERSION=1.2.6+7+gf98d547
gittag=${pkgver}

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
