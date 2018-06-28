#!/bin/sh

#vcs=none
pkgname=help2man
pkgver=1.47.5
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=1309

undead_make() {
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --libdir=/usr/lib
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
