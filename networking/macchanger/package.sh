#!/bin/sh

pkgname=macchanger
pkgver=1.7.0
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
