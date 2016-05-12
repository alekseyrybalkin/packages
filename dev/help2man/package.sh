#!/bin/sh

#vcs=none
pkgname=help2man
pkgver=1.47.3
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --libdir=/usr/lib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
