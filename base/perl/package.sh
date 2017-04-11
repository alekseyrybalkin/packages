#!/bin/sh

pkgname=perl
pkgver=5.24.1
vcs=git
gittag=v${pkgver}
urls="http://www.cpan.org/src/5.0/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    export BUILD_ZLIB=False
    export BUILD_BZIP2=0
    sh Configure -des -Dprefix=/usr \
        -Dvendorprefix=/usr \
        -Dman1dir=/usr/share/man/man1 \
        -Dman3dir=/usr/share/man/man3 \
        -Dpager="/usr/bin/less -isR" \
        -Duseshrplib \
        -Di_db=undef
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
