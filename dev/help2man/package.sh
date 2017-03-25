#!/bin/sh

#vcs=none
pkgname=help2man
pkgver=1.47.4
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=1309

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
