#!/bin/sh

pkgname=perl
pkgver=5.30.0
vcs=git
gittag=v${pkgver}
# development versions
#relmon_id=13599

build() {
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

package() {
    make DESTDIR=${pkgdir} install
}
