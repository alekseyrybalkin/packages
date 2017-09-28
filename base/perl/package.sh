#!/bin/sh

pkgname=perl
pkgver=5.26.1
vcs=git
gittag=v${pkgver}
urls="http://www.cpan.org/src/5.0/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
# development versions
#relmon_id=13599

kiin_make() {
    export BUILD_ZLIB=False
    export BUILD_BZIP2=0
    sh Configure -des -Dprefix=/usr \
        -Dvendorprefix=/usr \
        -Dman1dir=/usr/share/man/man1 \
        -Dman3dir=/usr/share/man/man3 \
        -Dpager="/usr/bin/less -isR" \
        -Duseshrplib \
        -Dusethreads \
        -Di_db=undef
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
